package app.badfella.extension.ticktick;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import app.badfella.extension.ticktick.locallists.AccountScope;
import app.badfella.extension.ticktick.locallists.CapacityException;
import app.badfella.extension.ticktick.locallists.LocalList;
import app.badfella.extension.ticktick.locallists.LocalListsBackup;
import app.badfella.extension.ticktick.locallists.LocalListsException;
import app.badfella.extension.ticktick.locallists.LocalListsOpenHelper;
import app.badfella.extension.ticktick.locallists.LocalListsStore;
import app.badfella.extension.ticktick.locallists.Membership;
import app.badfella.extension.ticktick.locallists.TaskSnapshot;
import app.badfella.extension.ticktick.locallists.BackupPolicy;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Settings-only organizer. This screen opens from a BadFella Settings
 * preference. It does not add entries to TickTick's normal drawer or project
 * picker; that integration is a separate, unverified milestone.
 */
public final class BadFellaSettingsActivity extends Activity {
    public static final String EXTRA_CREATE_LIST = "badfella_create_local_list";
    private static final int REQUEST_EXPORT = 1001;
    private static final int REQUEST_IMPORT = 1002;
    private static final int REQUEST_RECOVER = 1003;
    private static final int REQUEST_BACKUP_FOLDER = 1004;
    private static final int MAX_DISPLAYED_TASKS = 300;

    private final Handler main = new Handler(Looper.getMainLooper());
    private ExecutorService io;
    private TickTickBridge bridge;
    private LocalListsStore store;
    private LocalListsOpenHelper helper;
    private AccountScope scope;

    private List<LocalList> lists = new ArrayList<LocalList>();
    private List<Membership> memberships = new ArrayList<Membership>();
    private Map<String, TickTickBridge.TaskData> tasks =
            new HashMap<String, TickTickBridge.TaskData>();
    private int unresolvedCount;
    private int capacity = LocalListsStore.DEFAULT_CAPACITY;
    private String currentListUuid;
    private String status;
    private boolean busy;
    private boolean initialized;
    private boolean destroyed;
    private long pendingBackupMinutes;
    private String pendingBackupAccount;
    private int foreground, muted, surface, background, accent;
    private SharedPreferences backupPreferences;
    private final SharedPreferences.OnSharedPreferenceChangeListener backupObserver =
            new SharedPreferences.OnSharedPreferenceChangeListener() {
        @Override public void onSharedPreferenceChanged(SharedPreferences prefs, String key) {
            if ("lastSuccess".equals(key) || "error".equals(key)) {
                post(new Runnable() { @Override public void run() {
                    if (initialized && currentListUuid == null) renderMain();
                }});
            }
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        boolean dark = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        setTheme(dark ? android.R.style.Theme_Material_NoActionBar
                : android.R.style.Theme_Material_Light_NoActionBar);
        super.onCreate(savedInstanceState);
        foreground = Color.parseColor(dark ? "#E9EFF7" : "#172B3A");
        muted = Color.parseColor(dark ? "#B0BDCB" : "#596B7B");
        surface = Color.parseColor(dark ? "#1D2935" : "#FFFFFF");
        background = Color.parseColor(dark ? "#101820" : "#F2F5F8");
        accent = Color.parseColor(dark ? "#66D9D0" : "#087F83");
        getWindow().getDecorView().post(new Runnable() {
            @Override public void run() {
                if (android.os.Build.VERSION.SDK_INT >= 30) {
                    android.view.WindowInsetsController controller = getWindow().getInsetsController();
                    int lightBars = android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                            | android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                    if (controller != null) controller.setSystemBarsAppearance(dark ? 0 : lightBars, lightBars);
                } else getWindow().getDecorView().setSystemUiVisibility(dark ? 0
                        : View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
            }
        });
        if (savedInstanceState != null) {
            pendingBackupMinutes = savedInstanceState.getLong("backupMinutes");
            pendingBackupAccount = savedInstanceState.getString("backupAccount");
        }
        io = Executors.newSingleThreadExecutor();
        showLoading("Opening local organizer...");
        io.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    bridge = TickTickBridge.create(BadFellaSettingsActivity.this);
                    scope = bridge.accountScope();
                    helper = new LocalListsOpenHelper(BadFellaSettingsActivity.this);
                    store = new LocalListsStore(helper);
                    final Data data = loadSync();
                    post(new Runnable() {
                        @Override
                        public void run() {
                            initialized = true;
                            applyData(data);
                            render();
                            if (getIntent().getBooleanExtra(EXTRA_CREATE_LIST, false)) {
                                getIntent().removeExtra(EXTRA_CREATE_LIST);
                                createList();
                            }
                        }
                    });
                } catch (final Throwable error) {
                    post(new Runnable() {
                        @Override
                        public void run() {
                            showFatal(error);
                        }
                    });
                }
            }
        });
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        state.putLong("backupMinutes", pendingBackupMinutes);
        state.putString("backupAccount", pendingBackupAccount);
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (!initialized || bridge == null || store == null) return;
        // Hide the previous account immediately, and refresh edits made in native task detail.
        showLoading("Refreshing local organizer...");
        io.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    final AccountScope current = bridge.accountScope();
                    final Data data = loadSyncFor(current);
                    main.post(new Runnable() {
                        @Override
                        public void run() {
                            if (destroyed) return;
                            try { bridge.verifyAccount(current); }
                            catch (Exception error) { clearAccountData(); showFatal(error); return; }
                            if (!current.equals(scope)) currentListUuid = null;
                            scope = current;
                            applyData(data);
                            render();
                        }
                    });
                } catch (final Throwable error) {
                    main.post(new Runnable() {
                        @Override public void run() {
                            if (!destroyed) { clearAccountData(); showFatal(error); }
                        }
                    });
                }
            }
        });
    }

    @Override
    protected void onDestroy() {
        destroyed = true;
        if (backupPreferences != null) backupPreferences.unregisterOnSharedPreferenceChangeListener(backupObserver);
        if (io != null) io.shutdownNow();
        if (store != null) {
            try {
                store.close();
            } catch (Throwable ignored) {
            }
        }
        super.onDestroy();
    }

    @Override
    public void onBackPressed() {
        if (currentListUuid != null) {
            currentListUuid = null;
            render();
            return;
        }
        super.onBackPressed();
    }

    private void post(Runnable runnable) {
        final AccountScope expected = scope;
        main.post(new Runnable() {
            @Override
            public void run() {
                if (destroyed) return;
                if (expected != null && bridge != null) {
                    try { bridge.verifyAccount(expected); }
                    catch (Exception error) { clearAccountData(); showFatal(error); return; }
                }
                runnable.run();
            }
        });
    }

    private void clearAccountData() {
        lists.clear();
        memberships.clear();
        tasks.clear();
        currentListUuid = null;
        scope = null;
        initialized = false;
        busy = false;
    }

    private void showLoading(String message) {
        LinearLayout root = column();
        root.setGravity(Gravity.CENTER);
        root.addView(text(message, 16, false));
        setContentView(root);
    }

    private void showFatal(Throwable error) {
        LinearLayout root = column();
        root.addView(text("BadFella Settings", 24, true));
        root.addView(text("Local lists are unavailable.", 16, true));
        root.addView(text(message(error), 14, false));
        Button retry = button("Retry", new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                recreate();
            }
        });
        root.addView(retry);
        setContentView(root);
    }

    private void applyData(Data data) {
        lists = data.lists;
        memberships = data.memberships;
        tasks = data.tasks;
        unresolvedCount = data.unresolved;
        capacity = data.capacity;
        if (backupPreferences != null) backupPreferences.unregisterOnSharedPreferenceChangeListener(backupObserver);
        backupPreferences = LocalBackupManager.prefs(this, scope.tag());
        backupPreferences.registerOnSharedPreferenceChangeListener(backupObserver);
        if (currentListUuid != null && findList(currentListUuid) == null) currentListUuid = null;
    }

    private Data loadSync() throws Exception {
        return loadSyncFor(scope);
    }

    private Data loadSyncFor(AccountScope account) throws Exception {
        if (bridge == null || store == null || account == null) {
            throw new LocalListsException("The local organizer is not ready");
        }
        bridge.verifyAccount(account);
        try { LocalBackupManager.ensureScheduled(this, account); }
        catch (java.io.IOException error) {
            LocalBackupManager.recordFailure(this, account.tag(), "Backup schedule needs attention. Choose the folder again.");
        }
        List<LocalList> localLists = store.lists(account.tag());
        List<Membership> localMemberships = store.memberships(account.tag());
        List<TickTickBridge.TaskData> allTasks = bridge.loadAllTasks(account);
        Map<String, TickTickBridge.TaskData> bySid =
                new HashMap<String, TickTickBridge.TaskData>();
        for (TickTickBridge.TaskData task : allTasks) bySid.put(task.getSid(), task);
        int unresolved = 0;
        for (Membership membership : localMemberships) {
            if (!bySid.containsKey(membership.getTaskSid())) unresolved++;
        }
        return new Data(localLists, localMemberships, bySid, unresolved,
                store.capacity(account.tag()));
    }

    private void render() {
        if (scope == null) {
            showFatal(new IllegalStateException("Sign in to TickTick first"));
            return;
        }
        LocalList current = currentListUuid == null ? null : findList(currentListUuid);
        if (current == null) {
            currentListUuid = null;
            renderMain();
        } else {
            renderList(current);
        }
    }

    private void renderMain() {
        LinearLayout content = column();
        Button back = button("‹ Back to TickTick", new View.OnClickListener() {
            @Override public void onClick(View view) { finish(); }
        });
        back.setBackgroundColor(Color.TRANSPARENT);
        back.setPadding(0, dp(8), dp(12), dp(8));
        content.addView(back);
        content.addView(text("BadFella Settings", 28, true));
        content.addView(secondary("Local lists and backups for TickTick"));
        if (status != null) content.addView(statusView(status));

        LinearLayout backups = card(content, "Backup & restore");
        LocalBackupManager.State backup = LocalBackupManager.state(this, scope);
        backups.addView(text("Last backup: " + (backup.lastSuccess == 0 ? "Never"
                : backupDate(backup.lastSuccess)), 17, true));
        boolean due = BackupPolicy.isDue(backup.lastSuccess, backup.minutes, System.currentTimeMillis());
        if (backup.error != null) backups.addView(statusView(backup.error));
        else if (due) backups.addView(statusView(backup.lastSuccess == 0
                ? "Create your first backup to protect local lists and assignments."
                : "Backup due — save a fresh copy of your local organization."));
        else backups.addView(secondary((backup.lastScheduled ? "Scheduled" : "Manual")
                + " backup saved successfully."));
        if (backup.omissions > 0) backups.addView(secondary("The last backup reported omissions. "
                + "Attachment files are not included."));
        backups.addView(button("Back up now", new View.OnClickListener() {
            @Override public void onClick(View view) { backupNow(); }
        }));
        settingsRow(backups, "Automatic backups", BackupPolicy.intervalLabel(backup.minutes),
                new View.OnClickListener() {
            @Override public void onClick(View view) { chooseBackupSchedule(); }
        });
        settingsRow(backups, "Backup folder", backup.folderName, new View.OnClickListener() {
            @Override public void onClick(View view) { chooseBackupFolder(backup.minutes); }
        });
        if (backup.minutes > 0) {
            long target = Math.max(backup.lastScheduledTime, backup.revision) + backup.minutes * 60_000L;
            backups.addView(secondary("Next target: " + backupDate(target)
                    + ". Android may delay runs to save battery. Each run creates a dated file."));
        }
        settingsRow(backups, "Import backup", "Restore organization; keep current cloud task contents",
                new View.OnClickListener() {
            @Override public void onClick(View view) { startImport(); }
        });
        backups.addView(secondary("Backups contain private task data. Keep the folder safe. "
                + "Attachment files are not included."));

        LinearLayout organizer = card(content, "Local lists");
        settingsRow(organizer, "List capacity", lists.size() + " used · limit " + capacity,
                new View.OnClickListener() {
            @Override public void onClick(View view) { chooseCapacity(); }
        });
        organizer.addView(button("+ New local list", new View.OnClickListener() {
            @Override public void onClick(View view) { createList(); }
        }));
        if (lists.isEmpty()) {
            organizer.addView(secondary("Create a list, then assign tasks or create a task in Inbox. "
                    + "Task contents keep syncing through TickTick."));
        } else {
            final CharSequence[] names = new CharSequence[lists.size()];
            final List<LocalList> choices = new ArrayList<>(lists);
            for (int i = 0; i < choices.size(); i++) names[i] = choices.get(i).getName();
            settingsRow(organizer, "Open local lists", lists.size() + " on this device",
                    new View.OnClickListener() {
                @Override public void onClick(View view) {
                    new AlertDialog.Builder(BadFellaSettingsActivity.this).setTitle("Local lists")
                            .setItems(names, new DialogInterface.OnClickListener() {
                        @Override public void onClick(DialogInterface dialog, int which) {
                            currentListUuid = choices.get(which).getUuid(); render();
                        }
                    }).setNegativeButton("Cancel", null).show();
                }
            });
        }
        settingsRow(organizer, "How local lists work", "Sync, backups and switching devices",
                new View.OnClickListener() {
            @Override public void onClick(View view) { explainLocalLists(); }
        });

        LinearLayout recovery = card(content, "Recovery");
        settingsRow(recovery, "Restore previous organization", "Undo an import; keep TickTick tasks",
                new View.OnClickListener() {
            @Override public void onClick(View view) { choosePreviousSnapshot(); }
        });
        if (unresolvedCount > 0) {
            settingsRow(recovery, "Recover missing tasks", unresolvedCount + " unresolved assignments",
                    new View.OnClickListener() {
                @Override public void onClick(View view) { startRecovery(); }
            });
        } else recovery.addView(secondary("All local assignments resolve to tasks in this account."));
        setContentView(scroll(content));
    }

    private String backupDate(long time) {
        return java.text.DateFormat.getDateTimeInstance(
                java.text.DateFormat.MEDIUM, java.text.DateFormat.SHORT).format(new Date(time));
    }

    private void backupNow() {
        if (LocalBackupManager.state(this, scope).folder == null) { startExport(); return; }
        runBackground("Saving local backup...", new IoAction() {
            @Override public void run(AccountScope account) throws Exception {
                LocalBackupManager.writeToFolder(BadFellaSettingsActivity.this, account,
                        new java.util.concurrent.atomic.AtomicBoolean(), false, 0);
            }
        }, new Runnable() {
            @Override public void run() { toast("Backup saved to your local folder"); render(); }
        });
    }

    private void chooseBackupSchedule() {
        new AlertDialog.Builder(this).setTitle("Automatic local backups")
                .setItems(new String[]{"Off", "Every 6 hours", "Daily", "Weekly", "Custom interval…"},
                        new DialogInterface.OnClickListener() {
            @Override public void onClick(DialogInterface dialog, int which) {
                if (which == 4) { customBackupInterval(); return; }
                setBackupSchedule(new long[]{0, 360, 1440, 10080}[which]);
            }
        }).setNegativeButton("Cancel", null).show();
    }

    private void customBackupInterval() {
        final EditText minutes = input("Minutes (15–43200)");
        minutes.setInputType(InputType.TYPE_CLASS_NUMBER);
        final AlertDialog dialog = new AlertDialog.Builder(this).setTitle("Backup interval")
                .setMessage("Enter 15 minutes to 30 days. Runs may be delayed by Android.")
                .setView(minutes).setPositiveButton("Save", null).setNegativeButton("Cancel", null).create();
        dialog.setOnShowListener(new DialogInterface.OnShowListener() {
            @Override public void onShow(DialogInterface ignored) {
                dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener() {
                    @Override public void onClick(View view) {
                        try {
                            long value = Long.parseLong(minutes.getText().toString());
                            if (value == 0) throw new IllegalArgumentException();
                            BackupPolicy.validateInterval(value);
                            dialog.dismiss(); setBackupSchedule(value);
                        } catch (IllegalArgumentException error) { minutes.setError("Use 15–43200 minutes"); }
                    }
                });
            }
        });
        dialog.show();
    }

    private void setBackupSchedule(final long minutes) {
        if (minutes != 0 && LocalBackupManager.state(this, scope).folder == null) {
            chooseBackupFolder(minutes); return;
        }
        runBackground("Updating backup schedule...", new IoAction() {
            @Override public void run(AccountScope account) throws Exception {
                LocalBackupManager.configure(BadFellaSettingsActivity.this, account, null, minutes);
            }
        }, new Runnable() {
            @Override public void run() { toast(minutes == 0 ? "Automatic backups off" : "Backup schedule saved"); render(); }
        });
    }

    private void chooseBackupFolder(long minutes) {
        pendingBackupMinutes = minutes;
        pendingBackupAccount = scope.tag();
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION | Intent.FLAG_GRANT_PREFIX_URI_PERMISSION);
        startActivityForResult(intent, REQUEST_BACKUP_FOLDER);
    }

    private void acceptBackupFolder(final Intent data) {
        final Uri uri = data.getData();
        final String expected = pendingBackupAccount;
        final long minutes = pendingBackupMinutes;
        pendingBackupAccount = null;
        runBackground("Saving backup folder...", new IoAction() {
            @Override public void run(AccountScope account) throws Exception {
                if (!account.tag().equals(expected)) throw new IllegalStateException("The account changed. Choose the folder again.");
                if (!"com.android.externalstorage.documents".equals(uri.getAuthority())) {
                    throw new IllegalArgumentException("Choose a folder in Internal storage or on an SD card");
                }
                int flags = data.getFlags() & (Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
                if ((flags & Intent.FLAG_GRANT_WRITE_URI_PERMISSION) == 0) {
                    throw new IllegalArgumentException("Allow write access to the backup folder");
                }
                getContentResolver().takePersistableUriPermission(uri, flags);
                LocalBackupManager.configure(BadFellaSettingsActivity.this, account, uri, minutes);
            }
        }, new Runnable() { @Override public void run() { render(); toast("Local backup folder saved"); } });
    }

    private void renderList(final LocalList list) {
        LinearLayout content = column();
        content.addView(button("< Local lists", new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                currentListUuid = null;
                render();
            }
        }));
        content.addView(text(list.getName(), 22, true));
        int count = 0;
        for (Membership membership : memberships) {
            if (membership.getListUuid().equals(list.getUuid())) count++;
        }
        content.addView(text(count + " local task(s)", 13, false));
        if (status != null) content.addView(statusView(status));

        content.addView(button("New task in Inbox", new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                newInboxTask(list);
            }
        }));
        content.addView(button("Assign an existing task", new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                pickTaskForList(list);
            }
        }));
        LinearLayout actions = row();
        actions.addView(button("Rename list", new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                renameList(list);
            }
        }));
        actions.addView(button("Delete list", new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                deleteList(list);
            }
        }));
        content.addView(actions);

        section(content, "Tasks");
        boolean any = false;
        for (final Membership membership : memberships) {
            if (!membership.getListUuid().equals(list.getUuid())) continue;
            any = true;
            TickTickBridge.TaskData task = tasks.get(membership.getTaskSid());
            if (task == null) {
                content.addView(missingRow(membership.getTaskSid()));
            } else {
                content.addView(taskRow(list, task));
            }
        }
        if (!any) content.addView(text("No tasks in this local list yet.", 13, false));
        content.addView(text("Opening a task uses TickTick's normal detail screen. "
                + "Its real cloud list is unchanged.", 12, false));
        setContentView(scroll(content));
    }

    private View taskRow(final LocalList list, final TickTickBridge.TaskData task) {
        LinearLayout wrapper = column();
        LinearLayout row = row();
        row.setPadding(0, dp(10), 0, dp(10));
        LinearLayout texts = column();
        texts.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        String title = task.getTitle() == null || task.getTitle().isEmpty()
                ? "(untitled task)" : task.getTitle();
        if (task.getStatus() == 2) title = "[done] " + title;
        texts.addView(text(title, 15, false));
        StringBuilder detail = new StringBuilder();
        if (task.getProjectName() != null) detail.append(task.getProjectName());
        if (task.getDueDate() != null) {
            if (detail.length() > 0) detail.append(" · ");
            detail.append("due ").append(formatDate(task.getDueDate().longValue()));
        }
        if (detail.length() > 0) texts.addView(text(detail.toString(), 12, false));
        row.addView(texts);
        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                openTask(task);
            }
        });
        row.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View view) {
                removeAssignment(list, task);
                return true;
            }
        });
        wrapper.addView(row);
        wrapper.addView(divider());
        return wrapper;
    }

    private View missingRow(final String sid) {
        LinearLayout wrapper = column();
        LinearLayout row = row();
        row.setPadding(0, dp(10), 0, dp(10));
        LinearLayout texts = column();
        texts.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        texts.addView(text("Missing task " + shortSid(sid), 15, true));
        texts.addView(text("Not found in this account. The assignment is kept unresolved.", 12, false));
        row.addView(texts);
        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new AlertDialog.Builder(BadFellaSettingsActivity.this)
                        .setTitle("Unresolved task")
                        .setMessage("Task SID: " + sid
                                + "\n\nThis local assignment is kept. Import a backup containing its "
                                + "snapshot to recover its contents.")
                        .setPositiveButton("Recover contents...", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                startRecovery();
                            }
                        })
                        .setNegativeButton("Close", null)
                        .show();
            }
        });
        wrapper.addView(row);
        wrapper.addView(divider());
        return wrapper;
    }

    private void chooseCapacity() {
        final int current = capacity;
        final String[] choices = {"299 (default)", "900"};
        int checked = current == 900 ? 1 : 0;
        new AlertDialog.Builder(this)
                .setTitle("Local list capacity")
                .setSingleChoiceItems(choices, checked, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        final int capacity = which == 1 ? 900 : 299;
                        dialog.dismiss();
                        if (capacity == current) return;
                        runBackground("Changing capacity...", new IoAction() {
                            @Override
                            public void run(AccountScope currentScope) throws Exception {
                                store.setCapacity(currentScope.tag(), capacity);
                            }
                        }, new Runnable() {
                            @Override
                            public void run() {
                                status = capacity < lists.size()
                                        ? "Capacity lowered. Existing lists are kept; new list creation is blocked until below the limit."
                                        : "Capacity set to " + capacity + ".";
                                reload(null);
                            }
                        });
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void createList() {
        final EditText input = input("List name");
        new AlertDialog.Builder(this)
                .setTitle("New local list")
                .setMessage("Stored on this device. Tasks keep syncing in their real TickTick list. "
                        + "Export a BadFella backup to keep the local list and its assignments.")
                .setView(input)
                .setPositiveButton("Create", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        final String name = input.getText().toString();
                        runBackground("Creating list...", new IoAction() {
                            @Override
                            public void run(AccountScope currentScope) throws Exception {
                                store.createList(currentScope.tag(), name, System.currentTimeMillis());
                            }
                        }, new Runnable() {
                            @Override
                            public void run() {
                                toast("Local list created");
                                reload(null);
                            }
                        });
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void explainLocalLists() {
        new AlertDialog.Builder(this).setTitle("How local lists work")
                .setMessage("1. Create a local list here, then assign existing tasks or create a task in Inbox. "
                        + "Choose 299 or 900 local lists with Change capacity.\n\n"
                        + "2. Task titles, notes and edits sync through TickTick in each task's real cloud list. "
                        + "Stock TickTick sees that cloud list (Inbox for tasks created here). "
                        + "Local list names and assignments exist only on this device.\n\n"
                        + "3. The drawer's Add List offers a local list once you have ten cloud lists. "
                        + "Open your local lists here; they are not added to the normal drawer yet.\n\n"
                        + "4. Export a backup before reinstalling or changing devices. Sign in to the same "
                        + "TickTick account, let tasks sync, then import it to restore organization. "
                        + "Import keeps current cloud content. Recover missing tasks is a separate action "
                        + "that creates new Inbox tasks.\n\n"
                        + "Backups contain private task data and supported snapshots. Attachment files "
                        + "are not included; the export reports other omissions. Deleting a local list "
                        + "removes its assignments, never its tasks.")
                .setPositiveButton("Got it", null).show();
    }

    private void renameList(final LocalList list) {
        final EditText input = input("List name");
        input.setText(list.getName());
        new AlertDialog.Builder(this)
                .setTitle("Rename local list")
                .setView(input)
                .setPositiveButton("Save", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        final String name = input.getText().toString();
                        runBackground("Renaming list...", new IoAction() {
                            @Override
                            public void run(AccountScope currentScope) throws Exception {
                                store.renameList(currentScope.tag(), list.getUuid(), name,
                                        System.currentTimeMillis());
                            }
                        }, new Runnable() {
                            @Override
                            public void run() {
                                toast("List renamed");
                                reload(null);
                            }
                        });
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void deleteList(final LocalList list) {
        int count = 0;
        for (Membership membership : memberships) {
            if (membership.getListUuid().equals(list.getUuid())) count++;
        }
        new AlertDialog.Builder(this)
                .setTitle("Delete local list?")
                .setMessage("Delete \"" + list.getName() + "\" and " + count
                        + " local assignment(s)?\n\nTickTick tasks are NOT deleted and their cloud "
                        + "lists are unchanged. Only BadFella's organization is removed.")
                .setPositiveButton("Delete list", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        runBackground("Deleting list...", new IoAction() {
                            @Override
                            public void run(AccountScope currentScope) throws Exception {
                                store.deleteList(currentScope.tag(), list.getUuid());
                            }
                        }, new Runnable() {
                            @Override
                            public void run() {
                                currentListUuid = null;
                                toast("Local list deleted; tasks were not touched");
                                reload(null);
                            }
                        });
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void newInboxTask(final LocalList list) {
        final EditText input = input("Task title");
        new AlertDialog.Builder(this)
                .setTitle("New task in Inbox")
                .setMessage("The task is created through TickTick's normal service in Inbox, "
                        + "then added to this local list.")
                .setView(input)
                .setPositiveButton("Create", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        final String title = input.getText().toString();
                        if (title.trim().isEmpty()) {
                            toast("A task title is required");
                            return;
                        }
                        final AccountScope current = scope;
                        final long now = System.currentTimeMillis();
                        runBackground("Creating task in Inbox...", new IoAction() {
                            @Override
                            public void run(AccountScope currentScope) throws Exception {
                                TickTickBridge.CreatedTask created =
                                        bridge.createInboxTask(current, title, null);
                                store.assignTask(current.tag(), created.getSid(), list.getUuid(), now);
                            }
                        }, new Runnable() {
                            @Override
                            public void run() {
                                toast("Created in Inbox and added to the local list");
                                reload(null);
                            }
                        });
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void pickTaskForList(final LocalList list) {
        runBackground("Loading tasks...", new IoAction() {
            @Override
            public void run(AccountScope currentScope) throws Exception {
                final Data data = loadSyncFor(currentScope);
                post(new Runnable() {
                    @Override
                    public void run() {
                        applyData(data);
                        showTaskPicker(list, data);
                    }
                });
            }
        }, null);
    }

    private void showTaskPicker(final LocalList list, final Data data) {
        final List<TickTickBridge.TaskData> all = new ArrayList<TickTickBridge.TaskData>(data.tasks.values());
        Collections.sort(all, new Comparator<TickTickBridge.TaskData>() {
            @Override
            public int compare(TickTickBridge.TaskData left, TickTickBridge.TaskData right) {
                long a = left.getModifiedTime() == null ? 0 : left.getModifiedTime().longValue();
                long b = right.getModifiedTime() == null ? 0 : right.getModifiedTime().longValue();
                return a == b ? left.getSid().compareTo(right.getSid()) : (a > b ? -1 : 1);
            }
        });
        final List<TickTickBridge.TaskData> filtered =
                new ArrayList<TickTickBridge.TaskData>();
        final List<String> labels = new ArrayList<String>();
        final ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1, labels);
        final ListView listView = new ListView(this);
        listView.setAdapter(adapter);
        final EditText search = input("Search tasks by title");
        final TextView hint = text("", 12, false);
        LinearLayout content = column();
        content.addView(search);
        content.addView(hint);
        content.addView(listView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(320)));
        final AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle("Assign a task to \"" + list.getName() + "\"")
                .setView(content)
                .setNegativeButton("Cancel", null)
                .create();
        search.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                filterTasks(all, s.toString(), filtered, labels, adapter, hint);
            }

            @Override
            public void afterTextChanged(Editable s) {
            }
        });
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                if (position < 0 || position >= filtered.size()) return;
                final TickTickBridge.TaskData task = filtered.get(position);
                dialog.dismiss();
                runBackground("Assigning task...", new IoAction() {
                    @Override
                    public void run(AccountScope currentScope) throws Exception {
                        store.assignTask(currentScope.tag(), task.getSid(), list.getUuid(),
                                System.currentTimeMillis());
                    }
                }, new Runnable() {
                    @Override
                    public void run() {
                        toast("Task assigned locally; its cloud list is unchanged");
                        reload(null);
                    }
                });
            }
        });
        filterTasks(all, "", filtered, labels, adapter, hint);
        dialog.show();
    }

    private void filterTasks(List<TickTickBridge.TaskData> all, String query,
            List<TickTickBridge.TaskData> filtered, List<String> labels,
            ArrayAdapter<String> adapter, TextView hint) {
        String needle = query == null ? "" : query.trim().toLowerCase(Locale.ROOT);
        filtered.clear();
        labels.clear();
        for (TickTickBridge.TaskData task : all) {
            String title = task.getTitle() == null ? "" : task.getTitle();
            if (needle.isEmpty() || title.toLowerCase(Locale.ROOT).contains(needle)) {
                if (filtered.size() >= MAX_DISPLAYED_TASKS) break;
                filtered.add(task);
                labels.add((task.getStatus() == 2 ? "[done] " : "") + title
                        + (task.getProjectName() == null ? "" : "  ·  " + task.getProjectName()));
            }
        }
        adapter.notifyDataSetChanged();
        hint.setText(filtered.size() >= MAX_DISPLAYED_TASKS
                ? "Showing the first " + MAX_DISPLAYED_TASKS + " matches; refine the search."
                : labels.size() + " task(s)");
    }

    private void openTask(final TickTickBridge.TaskData task) {
        try {
            if (!bridge.openTask(this, scope, task)) {
                toast("That task is no longer available");
                reload(null);
            }
        } catch (Exception error) {
            toast(message(error));
        }
    }

    private void removeAssignment(final LocalList list, final TickTickBridge.TaskData task) {
        new AlertDialog.Builder(this)
                .setTitle("Remove from local list?")
                .setMessage("Remove \"" + task.getTitle() + "\" from \"" + list.getName()
                        + "\"?\n\nThe TickTick task is not deleted and its cloud list is unchanged.")
                .setPositiveButton("Remove", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        runBackground("Removing assignment...", new IoAction() {
                            @Override
                            public void run(AccountScope currentScope) throws Exception {
                                store.unassignTask(currentScope.tag(), task.getSid());
                            }
                        }, new Runnable() {
                            @Override
                            public void run() {
                                toast("Removed from the local list");
                                reload(null);
                            }
                        });
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void startExport() {
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/json");
        intent.putExtra(Intent.EXTRA_TITLE, "badfella-local-lists-"
                + new SimpleDateFormat("yyyyMMdd-HHmm", Locale.US).format(new Date()) + ".json");
        startActivityForResult(intent, REQUEST_EXPORT);
    }

    private void startImport() {
        startJsonPicker(REQUEST_IMPORT);
    }

    private void startRecovery() {
        if (unresolvedCount == 0) {
            toast("No unresolved tasks to recover");
            return;
        }
        startJsonPicker(REQUEST_RECOVER);
    }

    private void startJsonPicker(int requestCode) {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/json");
        intent.putExtra(Intent.EXTRA_MIME_TYPES, new String[]{
                "application/json", "text/plain", "application/octet-stream"});
        startActivityForResult(intent, requestCode);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
        final Uri uri = data.getData();
        if (requestCode == REQUEST_BACKUP_FOLDER) acceptBackupFolder(data);
        else if (requestCode == REQUEST_EXPORT) exportTo(uri);
        else if (requestCode == REQUEST_IMPORT) importFrom(uri);
        else if (requestCode == REQUEST_RECOVER) recoverFrom(uri);
    }

    private void exportTo(final Uri uri) {
        final AccountScope current = scope;
        runBackground("Building backup...", new IoAction() {
            @Override
            public void run(AccountScope currentScope) throws Exception {
                bridge.verifyAccount(current);
                final LocalListsBackup.ExportResult result = LocalBackupManager.createArchive(bridge, store, current);
                OutputStream output = getContentResolver().openOutputStream(uri, "wt");
                if (output == null) throw new LocalListsException("Could not open the selected file");
                try {
                    output.write(result.getJson().getBytes("UTF-8"));
                    output.flush();
                } finally {
                    output.close();
                }
                bridge.verifyAccount(current);
                LocalBackupManager.recordSuccess(BadFellaSettingsActivity.this, current, result, false);
                post(new Runnable() {
                    @Override
                    public void run() {
                        status = "Exported " + result.getListCount() + " list(s), "
                                + result.getMembershipCount() + " assignment(s), "
                                + result.getTaskSnapshotCount() + " task snapshot(s)."
                                + (result.getMissingSnapshotCount() > 0
                                ? " " + result.getMissingSnapshotCount()
                                + " assigned task(s) had no snapshot." : "")
                                + (result.getAttachmentMetadataCount() > 0
                                ? " Attachment file contents were not included ("
                                + result.getAttachmentMetadataCount() + " metadata entries)." : "")
                                + (result.getOmittedFields().isEmpty() ? ""
                                : " Unsupported task fields: "
                                + summarizeFields(result.getOmittedFields()) + ".");
                        toast("Backup written. It contains private task contents.");
                        render();
                    }
                });
            }
        }, null);
    }

    private void importFrom(final Uri uri) {
        final AccountScope current = scope;
        runBackground("Reading backup...", new IoAction() {
            @Override
            public void run(AccountScope currentScope) throws Exception {
                InputStream input = getContentResolver().openInputStream(uri);
                if (input == null) throw new LocalListsException("Could not open the selected file");
                LocalListsBackup.Archive archive;
                try {
                    archive = LocalListsBackup.read(input, current,
                            LocalListsBackup.MAX_JSON_BYTES);
                } finally {
                    input.close();
                }
                List<TickTickBridge.TaskData> all = bridge.loadAllTasks(current);
                Set<String> known = new HashSet<String>();
                for (TickTickBridge.TaskData task : all) known.add(task.getSid());
                final LocalListsBackup.ImportPlan plan =
                        LocalListsBackup.preview(archive, store, known);
                post(new Runnable() {
                    @Override
                    public void run() {
                        confirmImport(plan, current);
                    }
                });
            }
        }, null);
    }

    private void confirmImport(final LocalListsBackup.ImportPlan plan, final AccountScope current) {
        LocalListsBackup.Counts counts = plan.getCounts();
        int attachments = 0;
        Set<String> omitted = new java.util.LinkedHashSet<String>();
        for (TaskSnapshot task : plan.getArchive().getTasks()) {
            attachments += task.getAttachments().size();
            omitted.addAll(task.getOmittedFields());
        }
        String message = "Lists: " + counts.listsAdded + " new, " + counts.listsUpdated
                + " updated, " + counts.listsUnchanged + " unchanged.\n"
                + "Assignments: " + counts.membershipsApplied + " new, "
                + counts.membershipsUnchanged + " unchanged, "
                + counts.membershipsConflicting + " conflicting (existing mapping kept), "
                + counts.membershipsUnresolved + " unresolved (task not found).\n"
                + "Task snapshots: " + plan.getArchive().getTasks().size()
                + " (content is not applied automatically).\n"
                + (attachments > 0
                ? "Attachments: " + attachments + " metadata entries; file contents are not included.\n"
                : "")
                + (omitted.isEmpty() ? ""
                : "Unsupported task fields: " + summarizeFields(omitted) + ".\n")
                + (plan.getArchive().getIgnoredFields().isEmpty() ? ""
                : "Unknown backup fields ignored: "
                + summarizeFields(plan.getArchive().getIgnoredFields()) + ".\n")
                + "\nOnly local organization is merged. TickTick task contents win and are never overwritten.";
        new AlertDialog.Builder(this)
                .setTitle("Import backup?")
                .setMessage(message)
                .setPositiveButton("Import", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        final File recovery = new File(recoveryDir(), "pre-import-"
                                + new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US)
                                .format(new Date()) + ".json");
                        runBackground("Importing backup...", new IoAction() {
                            @Override
                            public void run(AccountScope currentScope) throws Exception {
                                LocalListsBackup.ImportResult result =
                                        plan.apply(store, current, recovery);
                                final LocalListsBackup.Counts applied = result.getCounts();
                                final Data data = loadSyncFor(current);
                                post(new Runnable() {
                                    @Override
                                    public void run() {
                                        applyData(data);
                                        status = "Imported: " + applied.listsAdded + " new list(s), "
                                                + applied.listsUpdated + " updated, "
                                                + applied.membershipsApplied + " new assignment(s), "
                                                + applied.membershipsConflicting + " conflict(s) kept, "
                                                + applied.membershipsUnresolved + " unresolved.";
                                        toast("Organization imported; cloud tasks were not changed");
                                        render();
                                    }
                                });
                            }
                        }, null);
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void choosePreviousSnapshot() {
        runBackground("Looking for the previous snapshot...", new IoAction() {
            @Override
            public void run(AccountScope currentScope) throws Exception {
                File[] files = recoveryDir().listFiles();
                final List<File> snapshots = new ArrayList<File>();
                if (files != null) {
                    for (File file : files) {
                        if (file.isFile() && file.getName().startsWith("pre-import-")
                                && file.getName().endsWith(".json")) snapshots.add(file);
                    }
                }
                Collections.sort(snapshots, new Comparator<File>() {
                    @Override
                    public int compare(File left, File right) {
                        return right.getName().compareTo(left.getName());
                    }
                });
                if (snapshots.isEmpty()) {
                    post(new Runnable() {
                        @Override
                        public void run() {
                            toast("No previous organization snapshot exists yet");
                        }
                    });
                    return;
                }
                final File latest = snapshots.get(0);
                final LocalListsBackup.Archive archive = LocalListsBackup.read(
                        LocalListsBackup.readFile(latest, LocalListsBackup.MAX_JSON_BYTES),
                        currentScope);
                post(new Runnable() {
                    @Override
                    public void run() {
                        new AlertDialog.Builder(BadFellaSettingsActivity.this)
                                .setTitle("Restore previous organization?")
                                .setMessage("Replace the current local lists and assignments with "
                                        + latest.getName() + " (" + archive.getLists().size()
                                        + " list(s), " + archive.getMemberships().size()
                                        + " assignment(s))?\n\nTickTick tasks are NOT deleted or "
                                        + "edited. Only BadFella's organization is replaced.")
                                .setPositiveButton("Restore", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        runBackground("Restoring organization...", new IoAction() {
                                            @Override
                                            public void run(AccountScope currentScope) throws Exception {
                                                LocalListsBackup.restore(archive, store, currentScope);
                                            }
                                        }, new Runnable() {
                                            @Override
                                            public void run() {
                                                currentListUuid = null;
                                                status = "Previous organization restored. Cloud tasks were not changed.";
                                                toast("Organization restored");
                                                reload(null);
                                            }
                                        });
                                    }
                                })
                                .setNegativeButton("Cancel", null)
                                .show();
                    }
                });
            }
        }, null);
    }

    private void recoverFrom(final Uri uri) {
        final AccountScope current = scope;
        runBackground("Reading recovery snapshots...", new IoAction() {
            @Override
            public void run(AccountScope currentScope) throws Exception {
                InputStream input = getContentResolver().openInputStream(uri);
                if (input == null) throw new LocalListsException("Could not open the selected file");
                LocalListsBackup.Archive archive;
                try {
                    archive = LocalListsBackup.read(input, current,
                            LocalListsBackup.MAX_JSON_BYTES);
                } finally {
                    input.close();
                }
                List<TickTickBridge.TaskData> all = bridge.loadAllTasks(current);
                Set<String> known = new HashSet<String>();
                for (TickTickBridge.TaskData task : all) known.add(task.getSid());
                final LocalListsRecovery.Preview preview =
                        LocalListsRecovery.preview(archive, store, current, known);
                post(new Runnable() {
                    @Override
                    public void run() {
                        confirmRecovery(archive, current, known, preview);
                    }
                });
            }
        }, null);
    }

    private void confirmRecovery(final LocalListsBackup.Archive archive,
            final AccountScope current, final Set<String> known,
            final LocalListsRecovery.Preview preview) {
        if (preview.getRecoverableCount() == 0) {
            new AlertDialog.Builder(this)
                    .setTitle("Nothing to recover")
                    .setMessage("No snapshot in this backup matches an unresolved local assignment."
                            + (preview.getMissingWithoutSnapshot().isEmpty() ? ""
                            : " " + preview.getMissingWithoutSnapshot().size()
                            + " unresolved task(s) have no snapshot in this backup."))
                    .setPositiveButton("Close", null)
                    .show();
            return;
        }
        String message = preview.getRecoverableCount()
                + " missing task(s) have snapshots and can be created in Inbox.\n"
                + (preview.getMissingWithoutSnapshot().isEmpty() ? ""
                : preview.getMissingWithoutSnapshot().size()
                + " missing task(s) have no snapshot and cannot be recovered.\n")
                + (preview.getAttachmentMetadataCount() > 0
                ? "Attachments are metadata only; file contents are not restored ("
                + preview.getAttachmentMetadataCount() + " entries).\n" : "")
                + (preview.hasTags() ? "Tags are exported but are not re-created during recovery.\n" : "")
                + (preview.getOmittedFields().isEmpty() ? ""
                : "Unsupported task fields: " + summarizeFields(preview.getOmittedFields())
                + ".\n")
                + "\nRecovery creates NEW tasks in Inbox and moves only the local assignment to the "
                + "new task SID. Original cloud list, assignee and attachments are not restored. "
                + "Existing cloud tasks are never overwritten.";
        new AlertDialog.Builder(this)
                .setTitle("Recover missing task contents?")
                .setMessage(message)
                .setPositiveButton("Recover " + preview.getRecoverableCount(), new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        runBackground("Recovering tasks in Inbox...", new IoAction() {
                            @Override
                            public void run(AccountScope currentScope) throws Exception {
                                final LocalListsRecovery.Result result =
                                        LocalListsRecovery.recover(archive, store, current, known,
                                                bridge, System.currentTimeMillis());
                                final Data data = loadSyncFor(current);
                                post(new Runnable() {
                                    @Override
                                    public void run() {
                                        applyData(data);
                                        status = "Recovered " + result.getCreated().size()
                                                + " task(s) in Inbox."
                                                + (result.getFailures().isEmpty() ? ""
                                                : " Stopped: " + result.getFailures().get(0));
                                        toast(result.getCreated().size() + " task(s) recovered");
                                        render();
                                    }
                                });
                            }
                        }, null);
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void reload(final Runnable after) {
        runBackground("Refreshing...", new IoAction() {
            @Override
            public void run(AccountScope currentScope) throws Exception {
                final Data data = loadSyncFor(currentScope);
                post(new Runnable() {
                    @Override
                    public void run() {
                        applyData(data);
                        status = null;
                        render();
                        if (after != null) after.run();
                    }
                });
            }
        }, after);
    }

    private void runBackground(String message, final IoAction action, final Runnable onSuccess) {
        if (busy) return;
        if (bridge == null || store == null || scope == null) {
            toast("Local organizer is not ready");
            return;
        }
        busy = true;
        status = message;
        final String progress = message;
        final AccountScope current = scope;
        io.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    bridge.verifyAccount(current);
                    action.run(current);
                    post(new Runnable() {
                        @Override
                        public void run() {
                            busy = false;
                            if (onSuccess != null) onSuccess.run();
                            else {
                                if (progress.equals(status)) status = null;
                                render();
                            }
                        }
                    });
                } catch (final Throwable error) {
                    post(new Runnable() {
                        @Override
                        public void run() {
                            busy = false;
                            status = message(error);
                            toast(message(error));
                            render();
                        }
                    });
                }
            }
        });
    }

    private LocalList findList(String uuid) {
        for (LocalList list : lists) if (list.getUuid().equals(uuid)) return list;
        return null;
    }

    private File recoveryDir() {
        File dir = new File(getFilesDir(), "local-lists-recovery/" + scope.tag());
        if (!dir.exists()) dir.mkdirs();
        return dir;
    }

    private LinearLayout column() {
        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setPadding(dp(18), dp(18), dp(18), dp(28));
        return layout;
    }

    private LinearLayout row() {
        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.HORIZONTAL);
        layout.setGravity(Gravity.CENTER_VERTICAL);
        return layout;
    }

    private ScrollView scroll(View content) {
        ScrollView scroll = new ScrollView(this);
        scroll.setBackgroundColor(background);
        scroll.setClipToPadding(false);
        scroll.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
            @Override public android.view.WindowInsets onApplyWindowInsets(View view, android.view.WindowInsets insets) {
                view.setPadding(0, insets.getSystemWindowInsetTop(), 0, insets.getSystemWindowInsetBottom());
                return insets.consumeSystemWindowInsets();
            }
        });
        scroll.addView(content);
        return scroll;
    }

    private TextView secondary(String value) {
        TextView view = text(value, 14, false);
        view.setTextColor(muted);
        view.setLineSpacing(dp(3), 1);
        return view;
    }

    private LinearLayout card(LinearLayout parent, String title) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(18), dp(16), dp(18), dp(16));
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(surface);
        shape.setCornerRadius(dp(20));
        card.setBackground(shape);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.topMargin = dp(18);
        parent.addView(card, params);
        TextView heading = text(title, 20, true);
        heading.setPadding(0, 0, 0, dp(12));
        card.addView(heading);
        return card;
    }

    private void settingsRow(LinearLayout parent, String title, String summary, View.OnClickListener listener) {
        LinearLayout row = row();
        row.setPadding(0, dp(12), 0, dp(12));
        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.addView(text(title, 16, true));
        labels.addView(secondary(summary));
        row.addView(labels, new LinearLayout.LayoutParams(0, -2, 1));
        TextView arrow = text("›", 26, false);
        arrow.setTextColor(muted);
        arrow.setPadding(dp(12), 0, 0, 0);
        row.addView(arrow);
        row.setFocusable(true);
        row.setClickable(true);
        row.setOnClickListener(listener);
        row.setForeground(new RippleDrawable(ColorStateList.valueOf(0x22087F83), null, null));
        parent.addView(row);
    }

    private TextView text(String value, int sizeSp, boolean bold) {
        TextView text = new TextView(this);
        text.setText(value == null ? "" : value);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, sizeSp);
        text.setTextColor(foreground);
        if (bold) text.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        text.setPadding(0, dp(4), 0, dp(4));
        return text;
    }

    private TextView statusView(String value) {
        TextView view = text(value, 14, true);
        view.setTextColor(accent);
        return view;
    }

    private TextView section(LinearLayout parent, String title) {
        TextView header = text(title, 18, true);
        header.setPadding(0, dp(22), 0, dp(6));
        parent.addView(header);
        return header;
    }

    private Button button(String label, View.OnClickListener listener) {
        Button button = new Button(this);
        button.setText(label);
        button.setAllCaps(false);
        button.setGravity(Gravity.CENTER_VERTICAL);
        button.setTextColor(accent);
        button.setTextSize(15);
        button.setMinHeight(dp(48));
        button.setPadding(dp(16), dp(10), dp(16), dp(10));
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(dp(12));
        shape.setColor(surface);
        shape.setStroke(dp(1), accent);
        button.setBackground(new RippleDrawable(ColorStateList.valueOf(0x22087F83), shape, null));
        button.setOnClickListener(listener);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(4);
        button.setLayoutParams(params);
        return button;
    }

    private EditText input(String hint) {
        EditText input = new EditText(this);
        input.setHint(hint);
        input.setInputType(InputType.TYPE_CLASS_TEXT);
        input.setSingleLine(true);
        return input;
    }

    private View divider() {
        View view = new View(this);
        view.setBackgroundColor(Color.parseColor("#DDDDDD"));
        view.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(1)));
        return view;
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private void toast(String message) {
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
    }

    private String formatDate(long millis) {
        return new SimpleDateFormat("MMM d", Locale.US).format(new Date(millis));
    }

    private String shortSid(String sid) {
        if (sid == null) return "?";
        return sid.length() <= 10 ? sid : sid.substring(0, 10) + "...";
    }

    private String summarizeFields(java.util.Collection<String> fields) {
        StringBuilder result = new StringBuilder();
        int count = 0;
        for (String field : fields) {
            if (field == null || field.isEmpty()) continue;
            if (count == 6) {
                result.append(", ...");
                break;
            }
            if (count > 0) result.append(", ");
            result.append(field);
            count++;
        }
        return result.toString();
    }

    private String message(Throwable error) {
        if (error instanceof CapacityException) return error.getMessage();
        String text = error.getMessage();
        return text == null || text.isEmpty() ? error.getClass().getSimpleName() : text;
    }

    private interface IoAction {
        void run(AccountScope currentScope) throws Exception;
    }

    private static final class Data {
        final List<LocalList> lists;
        final List<Membership> memberships;
        final Map<String, TickTickBridge.TaskData> tasks;
        final int unresolved;
        final int capacity;

        Data(List<LocalList> lists, List<Membership> memberships,
                Map<String, TickTickBridge.TaskData> tasks, int unresolved, int capacity) {
            this.lists = lists;
            this.memberships = memberships;
            this.tasks = tasks;
            this.unresolved = unresolved;
            this.capacity = capacity;
        }
    }
}
