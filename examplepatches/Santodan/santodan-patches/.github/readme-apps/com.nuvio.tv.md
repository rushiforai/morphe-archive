These are the available patches for NuvioTV:

- **Finale dates in library and collections**: Adds separate settings to show the latest scheduled episode date on library and collection posters in `dd-MMM-yy` format.

| Collections | Library |
| -- | -- |
| <img src="images/NuvioTVDateCollection.png" width="400" alt="Collections"> | <img src="images/NuvioTVDateLibrary.png" width="400" alt="Library"> |

- **Keep airing series in Upcoming**: Adds a setting to keep series in the separate Upcoming row until their latest scheduled episode airs, with a finale-date badge.
![Upcoming](images/NuvioTVUpcoming.png)
- **Merge tracking progress**: Combines Nuvio Sync and connected tracking-provider progress and watched-show history, with a choice between highest progress and the most recent update. Library and collection Watched labels follow the selected provider for each show. Cached progress and watched history load without waiting for provider refresh; synchronization continues in the background.
- **Remaining episodes in Continue Watching**: Adds a setting to show the number of aired, unwatched episodes on Continue Watching cards.
![Remaining](images/NuvioTVRemainingCount.png)
- **Side-by-side installation**: Lets you choose a different package name and launcher name so the patched app can coexist with the official app.

On NuvioTV **1.1.0-beta.4**, patch settings are under **Layout > Santodan-Patches**. The two finale-date patches require beta.4; the other patches also support beta.2. Package and launcher names are configured when patching the APK.

<img src="images/NuvioTVMenu.png" width="800" alt="Santodan-Patches menu">
