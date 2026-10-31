package app.badfella.extension.ticktick;

import android.content.Context;

import app.badfella.extension.ticktick.locallists.AccountScope;
import app.badfella.extension.ticktick.locallists.TaskSnapshot;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Read-only (except explicit native create/recover actions) bridge to the
 * confirmed TickTick 8.2.4.0 entry points. The extension deliberately does not
 * compile against TickTick classes. Every required signature is verified at
 * runtime, and a missing signature fails visibly instead of guessing.
 */
public final class TickTickBridge {
    private static final String TASK_ACTIVITY = "com.ticktick.task.activity.TaskActivity";

    private final Object application;
    private final Object accountManager;
    private final Object taskService;
    private final Object projectService;
    private final Class<?> taskClass;
    private final Map<String, Method> methods = new HashMap<String, Method>();

    private TickTickBridge(Object application) throws BridgeException {
        this.application = application;
        this.accountManager = requiredNoArg(application, "getAccountManager");
        this.taskService = requiredNoArg(application, "getTaskService");
        this.projectService = requiredNoArg(application, "getProjectService");
        this.taskClass = taskClass();
    }

    public static TickTickBridge create(Context context) throws BridgeException {
        if (context == null) throw new BridgeException("No Android context");
        Context appContext = context.getApplicationContext();
        if (appContext == null) appContext = context;
        return new TickTickBridge(appContext);
    }

    private static Class<?> taskClass() throws BridgeException {
        try {
            return Class.forName("com.ticktick.task.data.Task2");
        } catch (ClassNotFoundException error) {
            throw new BridgeException("This TickTick build does not expose Task2", error);
        }
    }

    public AccountScope accountScope() throws BridgeException {
        Object userId = invoke(accountManager, "getCurrentUserId");
        if (!(userId instanceof String) || ((String) userId).trim().isEmpty()) {
            throw new BridgeException("Sign in to TickTick before using local lists");
        }
        Object user = invoke(accountManager, "getCurrentUser");
        String realm = null;
        if (user != null) {
            realm = stringOrNull(tryCall(user, "getApiDomain"));
            if (realm == null || realm.trim().isEmpty()) {
                realm = stringOrNull(tryCall(user, "getDomain"));
            }
        }
        return new AccountScope((String) userId, realm);
    }

    public void verifyAccount(AccountScope expected) throws BridgeException {
        if (expected == null) throw new BridgeException("No account selected");
        AccountScope current = accountScope();
        if (!current.equals(expected)) {
            throw new BridgeException("The TickTick account changed. Reopen BadFella Settings.");
        }
    }

    public String realmHint(AccountScope scope) {
        return scope == null ? "unknown" : scope.getRealm() + " / " + scope.shortTag();
    }

    public int cloudListCount(AccountScope expected) throws BridgeException {
        verifyAccount(expected);
        Object count = invoke(projectService, "getProjectCount", expected.getUserId());
        if (!(count instanceof Number)) throw new BridgeException("TickTick list count unavailable");
        // Stock AccountLimitManager subtracts Inbox before comparing the project allowance.
        int result = Math.max(0, ((Number) count).intValue() - 1);
        verifyAccount(expected);
        return result;
    }

    public List<TaskData> loadAllTasks(AccountScope expected) throws BridgeException {
        verifyAccount(expected);
        Object value = invoke(taskService, "getAllTasksNotDeletedByUserId", expected.getUserId());
        if (!(value instanceof List)) {
            throw new BridgeException("TickTick did not return a task list");
        }
        String inboxSid = inboxSid(expected.getUserId());
        List<TaskData> result = new ArrayList<TaskData>();
        for (Object task : (List<?>) value) {
            if (task == null || !taskClass.isInstance(task)) continue;
            result.add(buildTask(task, inboxSid));
        }
        verifyAccount(expected);
        return result;
    }

    public TaskData loadTask(AccountScope expected, String taskSid) throws BridgeException {
        if (taskSid == null) return null;
        verifyAccount(expected);
        Object task = invoke(taskService, "getTaskBySid", expected.getUserId(), taskSid);
        TaskData result = task == null ? null : buildTask(task, inboxSid(expected.getUserId()));
        verifyAccount(expected);
        return result;
    }

    public TaskSnapshot snapshotOf(TaskData data) throws BridgeException {
        if (data == null) throw new IllegalArgumentException("data is required");
        Object task = data.raw();
        TaskSnapshot.Builder builder = TaskSnapshot.builder(data.getSid())
                .title(stringOrEmpty(tryCall(task, "getTitle")))
                .content(stringOrNull(tryCall(task, "getContent")))
                .projectSid(stringOrNull(tryCall(task, "getProjectSid")))
                .parentSid(stringOrNull(tryCall(task, "getParentSid")))
                .timeZone(stringOrNull(tryCall(task, "getTimeZone")))
                .repeatFlag(stringOrNull(tryCall(task, "getRepeatFlag")))
                .status(intOr(tryCall(task, "getStatus"), 0))
                .priority(integerOrNull(tryCall(task, "getPriority")))
                .allDay(booleanOr(tryCall(task, "getIsAllDay"), false))
                .startDate(dateOrNull(tryCall(task, "getStartDate")))
                .dueDate(dateOrNull(tryCall(task, "getDueDate")))
                .completedTime(dateOrNull(tryCall(task, "getCompletedTime")))
                .createdTime(dateOrNull(tryCall(task, "getCreatedTime")))
                .modifiedTime(dateOrNull(tryCall(task, "getModifiedTime")))
                .repeatFirstDate(dateOrNull(tryCall(task, "getRepeatFirstDate")))
                .sortOrder(longOrNull(tryCall(task, "getSortOrder")));
        Object tags = tryCall(task, "getTags");
        if (tags instanceof Collection) {
            for (Object tag : (Collection<?>) tags) {
                if (tag instanceof String) builder.tag((String) tag);
            }
        }
        Object reminders = tryCall(task, "getReminders");
        if (reminders instanceof List) {
            for (Object reminder : (List<?>) reminders) {
                if (reminder == null) continue;
                Long remindTime = dateOrNull(tryCall(reminder, "getRemindTime"));
                String duration = stringOrNull(tryCall(reminder, "getDurationString"));
                if (duration == null && remindTime != null) {
                    builder.omittedField("reminderWithoutDuration");
                }
                builder.reminder(new TaskSnapshot.Reminder(
                        remindTime,
                        duration,
                        booleanOr(tryCall(reminder, "isAllDayTask"), false)));
            }
        }
        Object checklist = tryCall(task, "getChecklistItems");
        if (checklist instanceof List) {
            for (Object item : (List<?>) checklist) {
                if (item == null) continue;
                builder.checklistItem(new TaskSnapshot.ChecklistItem(
                        stringOrNull(tryCall(item, "getSid")),
                        stringOrNull(tryCall(item, "getTitle")),
                        booleanOr(tryCall(item, "isChecked"), false),
                        intOr(tryCall(item, "getStatus"), 0),
                        longOrNull(tryCall(item, "getSortOrder")),
                        dateOrNull(tryCall(item, "getStartDate")),
                        booleanOr(tryCall(item, "getAllDay"), false),
                        stringOrNull(tryCall(item, "getTimeZone")),
                        dateOrNull(tryCall(item, "getCompletedTime"))));
            }
        }
        Object attachments = tryCall(task, "getAttachments");
        if (attachments instanceof List) {
            for (Object attachment : (List<?>) attachments) {
                if (attachment == null) continue;
                Object fileType = tryCall(attachment, "getFileType");
                builder.attachment(new TaskSnapshot.Attachment(
                        stringOrNull(tryCall(attachment, "getSid")),
                        stringOrNull(tryCall(attachment, "getFileName")),
                        longOrNull(tryCall(attachment, "getSize")),
                        fileType == null ? null : String.valueOf(fileType),
                        stringOrNull(tryCall(attachment, "getDescription")),
                        booleanOr(tryCall(attachment, "isFileValid"), false)));
            }
            if (!((List<?>) attachments).isEmpty()) builder.omittedField("attachmentBytes");
        }
        if (tryCall(task, "getLocation") != null) builder.omittedField("location");
        if (longOr(tryCall(task, "getAssignee"), 0L) > 0L) builder.omittedField("assignee");
        if (tryCall(task, "getColumn") != null) builder.omittedField("column");
        if (intOr(tryCall(task, "getCommentCount"), 0) > 0) builder.omittedField("comments");
        Object pomodoro = tryCall(task, "getPomodoroSummaries");
        if (pomodoro instanceof Collection && !((Collection<?>) pomodoro).isEmpty()) {
            builder.omittedField("pomodoro");
        }
        Object exceptions = tryCall(task, "getExDateValues");
        if (exceptions instanceof Collection && !((Collection<?>) exceptions).isEmpty()) {
            builder.omittedField("recurrenceExceptions");
        }
        Object kind = tryCall(task, "getKind");
        String kindName = kind == null ? null : String.valueOf(kind);
        if (kindName != null && !"TEXT".equals(kindName) && !"TASK".equals(kindName)) {
            builder.omittedField("kind:" + kindName);
        }
        return builder.build();
    }

    private TaskData buildTask(Object task, String inboxSid) throws BridgeException {
        String sid = stringOrNull(tryCall(task, "getSid"));
        if (sid == null || sid.isEmpty()) throw new BridgeException("TickTick returned a task without a SID");
        String projectSid = stringOrNull(tryCall(task, "getProjectSid"));
        Object project = tryCall(task, "getProject");
        String projectName = project == null ? null : stringOrNull(tryCall(project, "getName"));
        if (projectName == null && projectSid != null) {
            projectName = projectSid.equals(inboxSid) ? "Inbox" : projectSid;
        }
        Object kind = tryCall(task, "getKind");
        return new TaskData(task, sid, stringOrEmpty(tryCall(task, "getTitle")),
                stringOrNull(tryCall(task, "getContent")), projectSid, projectName,
                dateOrNull(tryCall(task, "getDueDate")),
                dateOrNull(tryCall(task, "getStartDate")),
                intOr(tryCall(task, "getStatus"), 0),
                integerOrNull(tryCall(task, "getPriority")),
                booleanOr(tryCall(task, "getIsAllDay"), false),
                stringOrNull(tryCall(task, "getParentSid")),
                kind == null ? null : String.valueOf(kind),
                dateOrNull(tryCall(task, "getModifiedTime")),
                dateOrNull(tryCall(task, "getCompletedTime")));
    }

    public CreatedTask createInboxTask(AccountScope expected, String title, String content)
            throws BridgeException {
        verifyAccount(expected);
        Object inbox = invoke(projectService, "getInbox", expected.getUserId());
        if (inbox == null) throw new BridgeException("TickTick's Inbox is not available");
        try {
            Object task = taskClass.getConstructor().newInstance();
            invoke(task, "setUserId", expected.getUserId());
            invoke(task, "setTitle", title == null ? "" : title);
            if (content != null) invoke(task, "setContent", content);
            invoke(task, "setProject", inbox);
            if (tryCall(task, "getProjectSid") == null) {
                invoke(task, "setProjectSid", stringOrNull(tryCall(inbox, "getSid")));
            }
            if (tryCall(task, "getProjectId") == null) {
                invoke(task, "setProjectId", longOrNull(tryCall(inbox, "getId")));
            }
            Object created = invoke(taskService, "createTask", task);
            if (!(created instanceof Boolean) || !((Boolean) created).booleanValue()) {
                throw new BridgeException("TickTick did not create the task");
            }
            String sid = stringOrNull(tryCall(task, "getSid"));
            if (sid == null || sid.isEmpty()) {
                throw new BridgeException("TickTick created a task without a SID");
            }
            notifyTaskCreated();
            verifyAccount(expected);
            return new CreatedTask(sid, title == null ? "" : title);
        } catch (BridgeException error) {
            throw error;
        } catch (Exception error) {
            throw new BridgeException("Could not create a task in Inbox", error);
        }
    }

    public CreatedTask recoverTask(AccountScope expected, TaskSnapshot snapshot,
            String parentSidRemapped) throws BridgeException {
        verifyAccount(expected);
        Object inbox = invoke(projectService, "getInbox", expected.getUserId());
        if (inbox == null) throw new BridgeException("TickTick's Inbox is not available");
        try {
            Object task = taskClass.getConstructor().newInstance();
            invoke(task, "setUserId", expected.getUserId());
            invoke(task, "setTitle", snapshot.getTitle() == null ? "" : snapshot.getTitle());
            if (snapshot.getContent() != null) invoke(task, "setContent", snapshot.getContent());
            invoke(task, "setProject", inbox);
            if (tryCall(task, "getProjectSid") == null) {
                invoke(task, "setProjectSid", stringOrNull(tryCall(inbox, "getSid")));
            }
            if (tryCall(task, "getProjectId") == null) {
                invoke(task, "setProjectId", longOrNull(tryCall(inbox, "getId")));
            }
            invoke(task, "setStatus", snapshot.getStatus());
            if (snapshot.getPriority() != null) invoke(task, "setPriority", snapshot.getPriority());
            invoke(task, "setIsAllDay", snapshot.isAllDay());
            if (snapshot.getStartDate() != null) {
                invoke(task, "setStartDate", new Date(snapshot.getStartDate().longValue()));
            }
            if (snapshot.getDueDate() != null) {
                invoke(task, "setDueDate", new Date(snapshot.getDueDate().longValue()));
            }
            if (snapshot.getCompletedTime() != null) {
                invoke(task, "setCompletedTime", new Date(snapshot.getCompletedTime().longValue()));
            }
            if (snapshot.getTimeZone() != null) invoke(task, "setTimeZone", snapshot.getTimeZone());
            if (snapshot.getRepeatFlag() != null) invoke(task, "setRepeatFlag", snapshot.getRepeatFlag());
            if (snapshot.getRepeatFirstDate() != null) {
                invoke(task, "setRepeatFirstDate",
                        new Date(snapshot.getRepeatFirstDate().longValue()));
            }
            if (snapshot.getSortOrder() != null) invoke(task, "setSortOrder", snapshot.getSortOrder());
            if (parentSidRemapped != null && !parentSidRemapped.isEmpty()) {
                invoke(task, "setParentSid", parentSidRemapped);
            }

            List<Object> checklistItems = new ArrayList<Object>();
            for (TaskSnapshot.ChecklistItem item : snapshot.getChecklist()) {
                Object checklist = Class.forName("com.ticktick.task.data.ChecklistItem")
                        .getConstructor().newInstance();
                invoke(checklist, "setTitle", item.getTitle() == null ? "" : item.getTitle());
                invoke(checklist, "setChecked", item.isChecked() ? 1 : 0);
                invoke(checklist, "setStatus", item.getStatus());
                invoke(checklist, "setAllDay", item.isAllDay());
                if (item.getSortOrder() != null) invoke(checklist, "setSortOrder", item.getSortOrder());
                if (item.getStartDate() != null) {
                    invoke(checklist, "setStartDate", new Date(item.getStartDate().longValue()));
                }
                if (item.getTimeZone() != null) invoke(checklist, "setTimeZone", item.getTimeZone());
                if (item.getCompletedTime() != null) {
                    invoke(checklist, "setCompletedTime",
                            new Date(item.getCompletedTime().longValue()));
                }
                checklistItems.add(checklist);
            }
            if (!checklistItems.isEmpty()) invoke(task, "setChecklistItems", checklistItems);

            List<Object> reminders = new ArrayList<Object>();
            for (TaskSnapshot.Reminder reminder : snapshot.getReminders()) {
                Object taskReminder = Class.forName("com.ticktick.task.data.TaskReminder")
                        .getConstructor().newInstance();
                if (reminder.getRemindTime() != null) {
                    invoke(taskReminder, "setRemindTime",
                            new Date(reminder.getRemindTime().longValue()));
                }
                if (reminder.getDuration() != null) {
                    invoke(taskReminder, "setDuration", reminder.getDuration());
                }
                invoke(taskReminder, "setSid", generateObjectId());
                reminders.add(taskReminder);
            }
            if (!reminders.isEmpty()) invoke(task, "setReminders", reminders);

            Object created = invoke(taskService, "createTask", task);
            if (!(created instanceof Boolean) || !((Boolean) created).booleanValue()) {
                throw new BridgeException("TickTick did not create the recovered task");
            }
            if (!checklistItems.isEmpty()) {
                invoke(taskService, "saveAddedChecklistItems", task);
            }
            String sid = stringOrNull(tryCall(task, "getSid"));
            if (sid == null || sid.isEmpty()) {
                throw new BridgeException("TickTick created a task without a SID");
            }
            verifyAccount(expected);
            notifyTaskCreated();
            return new CreatedTask(sid, snapshot.getTitle() == null ? "" : snapshot.getTitle());
        } catch (BridgeException error) {
            throw error;
        } catch (Exception error) {
            throw new BridgeException("Could not recover a task in Inbox", error);
        }
    }

    private void notifyTaskCreated() {
        // createTask persists data/reminders but does not request sync or reschedule alarms.
        // These are the same application broadcasts used by TickTick's native save flow.
        for (String action : new String[]{"tryToSendBroadcast", "sendTask2ReminderChangedBroadcast",
                "tryToBackgroundSync"}) {
            try { invoke(application, action); }
            catch (BridgeException error) {
                // The task already exists: preserve its mapping so a retry cannot duplicate it.
                android.util.Log.w("TickTickPatch", "Task refresh unavailable: " + action);
            }
        }
    }

    public boolean openTask(Context context, AccountScope expected, String sid)
            throws BridgeException {
        verifyAccount(expected);
        Object task = invoke(taskService, "getTaskBySid", expected.getUserId(), sid);
        if (task == null) return false;
        return startTaskActivity(context, task);
    }

    public boolean openTask(Context context, AccountScope expected, TaskData data)
            throws BridgeException {
        verifyAccount(expected);
        if (data == null) return false;
        return startTaskActivity(context, data.raw());
    }

    private boolean startTaskActivity(Context context, Object task) throws BridgeException {
        try {
            Class<?> activity = Class.forName(TASK_ACTIVITY);
            Method start = activity.getMethod("start", Context.class, taskClass, boolean.class);
            start.invoke(null, context, task, Boolean.TRUE);
            return true;
        } catch (Exception error) {
            throw new BridgeException("Could not open TickTick's task detail screen", error);
        }
    }

    private String inboxSid(String userId) {
        Object value = tryCall(projectService, "getInboxSid", userId);
        return value instanceof String ? (String) value : null;
    }

    private String generateObjectId() throws BridgeException {
        try {
            Class<?> utils = Class.forName("com.ticktick.task.utils.Utils");
            Method generate = utils.getMethod("generateObjectId");
            Object value = generate.invoke(null);
            if (!(value instanceof String) || ((String) value).isEmpty()) {
                throw new BridgeException("TickTick did not generate a task id");
            }
            return (String) value;
        } catch (Exception error) {
            throw new BridgeException("Could not generate a TickTick reminder id", error);
        }
    }

    private Object requiredNoArg(Object target, String name) throws BridgeException {
        Object value = tryInvoke(target, name);
        if (value == null) throw new BridgeException("TickTick is not ready: " + name + "() is null");
        return value;
    }

    private Object tryCall(Object target, String name, Object... args) {
        try {
            return args.length == 0 ? invokeNoArg(target, name) : invoke(target, name, args);
        } catch (BridgeException ignored) {
            return null;
        }
    }

    private Object invokeNoArg(Object target, String name) throws BridgeException {
        Method method = method(target.getClass(), name, new Object[0]);
        try {
            return method.invoke(target);
        } catch (InvocationTargetException error) {
            throw unwrap("call " + name, error);
        } catch (Exception error) {
            throw new BridgeException("Could not call TickTick " + name + "()", error);
        }
    }

    private Object tryInvoke(Object target, String name) throws BridgeException {
        return invokeNoArg(target, name);
    }

    private Object invoke(Object target, String name, Object... args) throws BridgeException {
        if (target == null) throw new BridgeException("TickTick object is null for " + name);
        Method method = method(target.getClass(), name, args);
        try {
            return method.invoke(target, args);
        } catch (InvocationTargetException error) {
            throw unwrap("call " + name, error);
        } catch (Exception error) {
            throw new BridgeException("Could not call TickTick " + name + "()", error);
        }
    }

    private Method method(Class<?> owner, String name, Object[] args) throws BridgeException {
        StringBuilder keyBuilder = new StringBuilder(owner.getName()).append('#').append(name);
        for (Object arg : args) {
            keyBuilder.append('#').append(arg == null ? "null" : arg.getClass().getName());
        }
        String key = keyBuilder.toString();
        Method cached = methods.get(key);
        if (cached != null) return cached;

        Method best = null;
        for (Class<?> ownerClass = owner; ownerClass != null && best == null;
                ownerClass = ownerClass.getSuperclass()) {
            for (Method candidate : ownerClass.getDeclaredMethods()) {
                if (!candidate.getName().equals(name)) continue;
                Class<?>[] parameters = candidate.getParameterTypes();
                if (parameters.length != args.length) continue;
                boolean compatible = true;
                boolean exact = true;
                for (int i = 0; i < parameters.length; i++) {
                    Class<?> parameter = wrap(parameters[i]);
                    Class<?> argument = args[i] == null ? null : args[i].getClass();
                    if (argument == null || !parameter.isAssignableFrom(argument)) {
                        compatible = false;
                        break;
                    }
                    if (!parameter.equals(argument)) exact = false;
                }
                if (!compatible) continue;
                if (exact) {
                    best = candidate;
                    break;
                }
                if (best == null) best = candidate;
            }
        }
        if (best == null) {
            throw new BridgeException("This TickTick build does not expose "
                    + owner.getSimpleName() + "." + name
                    + " with the expected parameters (8.2.4.0 is supported)");
        }
        best.setAccessible(true);
        methods.put(key, best);
        return best;
    }

    private static Class<?> wrap(Class<?> type) {
        if (!type.isPrimitive()) return type;
        if (type == int.class) return Integer.class;
        if (type == long.class) return Long.class;
        if (type == boolean.class) return Boolean.class;
        if (type == float.class) return Float.class;
        if (type == double.class) return Double.class;
        if (type == short.class) return Short.class;
        if (type == byte.class) return Byte.class;
        if (type == char.class) return Character.class;
        return type;
    }

    private static BridgeException unwrap(String action, InvocationTargetException error) {
        Throwable cause = error.getCause();
        if (cause instanceof RuntimeException) {
            return new BridgeException("TickTick failed during " + action, cause);
        }
        return new BridgeException("TickTick failed during " + action, cause == null ? error : cause);
    }

    private static String stringOrNull(Object value) {
        return value instanceof String ? (String) value : null;
    }

    private static String stringOrEmpty(Object value) {
        return value instanceof String ? (String) value : "";
    }

    private static Long dateOrNull(Object value) {
        return value instanceof Date ? Long.valueOf(((Date) value).getTime()) : null;
    }

    private static Long longOrNull(Object value) {
        return value instanceof Number ? Long.valueOf(((Number) value).longValue()) : null;
    }

    private static long longOr(Object value, long fallback) {
        return value instanceof Number ? ((Number) value).longValue() : fallback;
    }

    private static Integer integerOrNull(Object value) {
        return value instanceof Number ? Integer.valueOf(((Number) value).intValue()) : null;
    }

    private static int intOr(Object value, int fallback) {
        return value instanceof Number ? ((Number) value).intValue() : fallback;
    }

    private static boolean booleanOr(Object value, boolean fallback) {
        return value instanceof Boolean ? ((Boolean) value).booleanValue() : fallback;
    }

    public static final class BridgeException extends Exception {
        public BridgeException(String message) {
            super(message);
        }

        public BridgeException(String message, Throwable cause) {
            super(message, cause);
        }
    }

    public static final class CreatedTask {
        private final String sid;
        private final String title;

        private CreatedTask(String sid, String title) {
            this.sid = sid;
            this.title = title;
        }

        public String getSid() { return sid; }
        public String getTitle() { return title; }
    }

    public static final class TaskData {
        private final Object raw;
        private final String sid;
        private final String title;
        private final String content;
        private final String projectSid;
        private final String projectName;
        private final Long dueDate;
        private final Long startDate;
        private final int status;
        private final Integer priority;
        private final boolean allDay;
        private final String parentSid;
        private final String kind;
        private final Long modifiedTime;
        private final Long completedTime;

        private TaskData(Object raw, String sid, String title, String content, String projectSid,
                String projectName, Long dueDate, Long startDate, int status, Integer priority,
                boolean allDay, String parentSid, String kind, Long modifiedTime,
                Long completedTime) {
            this.raw = raw;
            this.sid = sid;
            this.title = title;
            this.content = content;
            this.projectSid = projectSid;
            this.projectName = projectName;
            this.dueDate = dueDate;
            this.startDate = startDate;
            this.status = status;
            this.priority = priority;
            this.allDay = allDay;
            this.parentSid = parentSid;
            this.kind = kind;
            this.modifiedTime = modifiedTime;
            this.completedTime = completedTime;
        }

        Object raw() { return raw; }
        public String getSid() { return sid; }
        public String getTitle() { return title; }
        public String getContent() { return content; }
        public String getProjectSid() { return projectSid; }
        public String getProjectName() { return projectName; }
        public Long getDueDate() { return dueDate; }
        public Long getStartDate() { return startDate; }
        public int getStatus() { return status; }
        public Integer getPriority() { return priority; }
        public boolean isAllDay() { return allDay; }
        public String getParentSid() { return parentSid; }
        public String getKind() { return kind; }
        public Long getModifiedTime() { return modifiedTime; }
        public Long getCompletedTime() { return completedTime; }
    }
}
