# Creating a new user offline (dead cloud)

> Knowledge base entry for the [Monument Morphe patches](../../README.md) bundle.
> Related: the [Login with token](../../patches/src/main/kotlin/app/morphe/patches/monument/loginwithtoken/README.md) patch.

With Monument's servers gone, the app can no longer invite or create users the normal way — those
buttons need the cloud. But you can still add a working user yourself by editing the device's
database directly, then signing in with the **Login with token** patch.

You do **not** need any extra patch for this. You need access to the device's database file — the
same access described in the Login with token guide (remove the device's SSD, connect it to a
computer, and open the database with a SQLite tool).

## Add a new user

Open the device database (`m.sqlite3`) and run:

```sql
-- 1. Create the user.
INSERT INTO User (id, name, email, status, created_at)
VALUES (900001, 'Second User', NULL, 'active', strftime('%s','now'));

-- 2. Give that user a login key.
INSERT INTO Client (user_id, created_at, secretkey, type)
VALUES (900001, strftime('%s','now'), randomblob(20), 1);

-- 3. Read back the two login values you'll type into the app.
SELECT C.id AS clid, lower(hex(C.secretkey)) AS token
FROM Client C WHERE C.user_id = 900001;
```

Then open the patched app → **More Options / Monument 1** → **Login with token**, and enter the
device **serial**, the **Client ID (clid)**, and the **Access token** from step 3.

## Notes

- **Pick an unused number** for the user `id` (`900001` is just an example). The device owner is
  already user number 1 — don't reuse it.
- **Already have an old invited or deleted account?** Turn it back on instead of making a new one:

  ```sql
  UPDATE User SET status='active', name='Second User' WHERE id=<that account's id>;
  INSERT INTO Client (user_id, created_at, secretkey, type)
  VALUES (<that account's id>, strftime('%s','now'), randomblob(20), 1);
  ```

  This also fixes the *"This user account is no longer available"* error.
- **The new user sees only their own photos.** They won't show up in the owner's user list or get
  shared albums automatically. For a standalone account that's fine.
- **Back up first.** Copy the database file (and any `-wal` / `-shm` files next to it) before
  editing, and edit it with the device turned off.
