# Disabling a user offline (dead cloud)

> Knowledge base entry for the [Monument Morphe patches](../../README.md) bundle.
> Related: [Creating a new user offline](offline-user-creation.md).

With Monument's servers gone, **deleting a user through the app no longer works.** The app does
its cleanup, but the final step of deletion contacts the cloud — that call fails, everything is
undone, and you get a *"Delete user request failed"* error. Nothing is removed.

The simple, safe alternative is to **disable the account** by editing the device database
directly (the same access used in the other entries: remove the device's SSD, connect it to a
computer, and open the database with a SQLite tool). The user can no longer sign in — including
with the token patch — but their photos stay on disk.

## Disable an account

Open the device database (`m.sqlite3`) and run:

```sql
UPDATE User SET status='deleted' WHERE id=<that account's id>;
```

That's it — that account can no longer log in. To turn it back on later, set `status='active'`
again.

To find the right `id`, list the accounts first:

```sql
SELECT id, name, email, status FROM User;
```

## Notes

- **Don't disable the device owner** (user number 1) — that's the main account the device is set
  up under.
- **This is not a full delete.** The user's photos and data remain on the device; the account is
  just locked out. Truly wiping a user and all their data by hand is advanced and error-prone
  (it spans many parts of the database), so it isn't covered here.
- **Back up first.** Copy the database file (and any `-wal` / `-shm` files next to it) before
  editing, and edit it with the device turned off.
