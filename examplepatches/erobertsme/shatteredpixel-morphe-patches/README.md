# 🍀 Cloverlord Patches

Morphe patches for [Shattered Pixel Dungeon](https://github.com/00-Evan/shattered-pixel-dungeon) 4.0.2, Google Play build.

## ❓ About

Cloverlord Patches add an **Extras** menu to Shattered Pixel Dungeon, with editors for your hero, inventory, enemies, floors and hunger, quality of life options, save management, teleporting and unlocks. Every patch is optional, and the editors can be switched on and off in **Extras → Editors**.

Patch settings work like this: settings changed on the main menu are the defaults for new games, and settings changed during a game are saved with that game. Unlocks, supporter options, favorites and hunger keep their own rules.

The full details of each patch are under [Patch details](#-patch-details).

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/erobertsme/shatteredpixel-morphe-patches

<a href="https://morphe.software/add-source?github=erobertsme/shatteredpixel-morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.10.1](https://github.com/erobertsme/shatteredpixel-morphe-patches/releases/tag/v1.10.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;11 patches total
<details open>
<summary>📦 Shattered Pixel Dungeon&nbsp;&nbsp;•&nbsp;&nbsp;11 patches</summary>
<br>

**Package name:** `com.shatteredpixel.shatteredpixeldungeon`

**🎯 Supported versions:**

| 4.0.3 | 4.0.2 |
| :---: | :---: |
| From github.com/00-Evan/shattered-pixel-dungeon/releases: ShatteredPD-v4.0.3-Gplay.apk, the Google Play version, or ShatteredPD-v4.0.3-Android.apk, which has no supporter features. |  |  |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Character editor](#character-editor) | Edit your hero's stats, talents, subclass, armor ability, modifiers, resistances and status effects. |  |
| [Enemy editor](#enemy-editor) | Edit any creature's health, side, behavior and status effects. |  |
| [Floor editor](#floor-editor) | Edit the tiles, traps, plants, area effects, items and creatures on the current floor, and draw the floor by dragging. |  |
| [Fun](#fun) | Just for fun: change your hero's sprite to another hero, an enemy or an NPC. |  |
| [Hunger editor](#hunger-editor) | Change how long each hunger stage lasts and how starving hurts, or switch hunger off. |  |
| [Inventory editor](#inventory-editor) | Edit gold, energy and every item, add any item, and identify or uncurse everything. Adds unlimited inventory space and Equipment and Rings backpack tabs. |  |
| [QoL enhancements](#qol-enhancements) | Confirm risky taps, a calmer shopkeeper, a Quantum Chest on boss floors, bigger bags, extra toolbar item slots, an Attack Tile button, an Enhanced Bestiary, a hero stats button, experience and loot rules, more items to energize, catalyst rerolls, walking through allies, item tags, display margins, a stronger Mageroyal, safe gardens, a preview of each game in progress and new games from any game's seed. |  |
| [Save management](#save-management) | Export and import all saves as a zip, keep up to 10 saves of each game, and Undo / Redo. Optional public, uncompressed save files. | • Public save folder<br>• Save folder<br>• Uncompressed saves<br>• Save file access |
| [Supporter options](#supporter-options) | NOTICE: This patch is not intended to gain these bonus extras for free. It is meant to ensure supporters are able to keep the benefits they paid for. Don't be a scumbag. Please support the developer!<br><br>Keep your supporter rewards and hide the Support button. Google Play version only. |  |
| [Teleport](#teleport) | Teleport to any floor, and teleport your hero or other creatures to any tile. |  |
| [Unlock all](#unlock-all) | Show all heroes, guides, lore, catalog items and bestiary entries as unlocked without changing your save. |  |

</details>

<!-- PATCHES_END -->

## 📖 Patch details

### Extras menu
Every patch that adds settings puts them in **Extras**, on the title screen and in the in-game menu. Extras has General, QoL, Unlocks and Editors tabs, and each tab only appears when its patch is included. The [i] buttons throughout explain each window, split into pages with icons where it helps.

### Character editor
- **Character** button in the in-game menu, shown with your hero's portrait, and an **Edit** button on each tab of the hero info window. A status's info window, opened from the status icons or the hero info window, has a **Remove** button in its top right corner.
- **Stats:** health, max health, level, experience, strength and shield.
- **Talents:** add or remove points and bonus points per tier, swap any talent like a Scroll of Metamorphosis (with an [i] for each choice), and change your **subclass** (bottom of tier 3) or **armor ability** (bottom of tier 4).
- **Mods**, on five pages: **Combat** (accuracy, evasion, damage, armor, attack and move speed, damage dealt, surprise hit damage, enchant power as extra Ring of Arcana levels), **Survival** (HP regen, healing received, shielding, damage taken, trap and fall damage, debuff and buff duration), **Senses** (vision, search range, search chance, stealth), **Rewards** (luck as extra Ring of Wealth levels, XP gain, gold found, shop deals, energize, thrown weapon durability) and **Rings** (extra levels of every other ring: Accuracy, Elements, Energy, Evasion, Force, Furor, Haste, Might, Sharpshooting and Tenacity). **Resistances** sets how much less fire, cold, lightning, poison, corrosion, ooze, paralysis and magic affect you, up to immune.
- **Status:** edit the turns left on any status, make one infinite (the star), remove one or all negative ones, and add any status from a picker with favorites.
- Everything is saved with the run.

### Enemy editor
- Small **Edit** button in the top right corner when you examine an enemy, NPC or other creature. Its status info windows have a **Remove** button.
- Edit its health and max health, switch it between enemy, neutral and ally, and set what it's doing (sleeping, wandering, hunting, fleeing or passive).
- **Move to Tile** sends it walking to a tile you tap; **Defeat** kills it.
- Edit, add or remove its status effects.
- With the Teleport patch, **Teleport** moves it straight to a tile you tap.

### Floor editor
- **Floor** button in the in-game menu, with **General** (map, draw and creatures), **Effects** and **Traps** tabs, and a small **Edit** button in the top right corner when you examine a tile, trap or item on the floor.
- **Tile:** add or remove gases and other area effects; add, change, remove, hide, reveal, disarm and trigger traps; plant seeds or remove plants; change the terrain, open, close, lock, unlock or hide doors; spawn any creature, at a chosen level for creatures that scale; place any item, choosing whether a trap there stays armed; delete the tile to an empty pit.
- **Quick buttons** on examine windows: doors (Open, Close, Lock, Unlock), traps (Activate, Deactivate, Hidden, Visible), grass (Unfurrowed, Furrowed, Trampled), exits (Lock, Unlock), chasms (Fill In) and barricades (Break). Hidden and Visible only show for traps that can be hidden.
- **Items on the floor:** Move Item or Move Pile to another tile, with the destination highlighted and a choice about any trap there.
- **Whole floor:** list every gas and area effect, including a Wand of Regrowth Lotus with its range and turns left (its falling leaves cover every tile in range), and remove them one at a time or all at once; remove all traps, reveal, hide, disarm or re-arm all traps, reveal the map, mark every tile as explored or forget the map, defeat all enemies, allies or neutral creatures.
- **Draw:** drag across the map to paint floor, wall or empty pit, move the view around, then Finish to keep or Cancel to undo.
- **Edit Floor** mode: the game is saved, then tapping any tile shows its info with an Edit button and a button for each creature, item, plant or trap on it; drag to look around. **Save** keeps the changes, **Cancel** asks "Dismiss all changes and exit edit mode?" and then reloads the game as it was.

- **Blacksmith:** an Edit button in the troll blacksmith's window sets your favor and whether he lets you down into the mine, even after his quest is done. His window keeps opening once your favor is used up, so you can add more.

### Fun
- **Fun** window (Extras → General).
- **Hero Sprite**: a grid of every look your hero can have: your own hero, the other heroes, and every enemy and NPC sprite. Tap one and your hero changes straight away; the first picture puts your own look back. Only the look changes, and the choice stays through armor changes.
- Main menu choice is the default for new games; a choice made during a game is saved with that game.

### Hunger editor
- **Hunger** window (Extras → General, the character editor, and the hunger summary on the hero info window).
- Change how many turns you stay full and hungry, with 75%, 50% and 30% presets, or switch hunger off.
- Starvation damage follows the game's formula or a fixed amount every so many turns, or can be switched off.
- Main menu settings are the defaults for new games; changes made during a game are saved with that game.

### Inventory editor
- **Inventory** button in the in-game menu.
- Edit gold and energy, add any item from a picker with categories and favorites, identify your carried items, learn every potion, scroll or ring type, and remove every curse.
- **Open Backpack** shows your real backpack in edit mode, titled *Backpack [Editing]*. Tapping an item goes straight to its editor. Outside edit mode, every item's description has an **Edit** button in its header. The editor covers level, quantity, identified, cursed, enchantment or glyph, augment, charges with an **infinite charges** option, waterskin water, blessing an ankh, alchemy conversions, duplicate and delete. A gear button returns to the inventory editor.
- **Unlimited inventory space:** every bag always has room for one more item, shown in pages of 8 rows with arrows that wrap and remember your page.
- **Equipment and Rings tabs** (switched on in Extras → QoL → Backpack): hold melee weapons and armor (class starter weapons included; not thrown weapons, bombs, the spirit bow or the pickaxe), or rings, like the potion bandolier, so they don't use backpack space. The shopkeeper button beside each tab makes it something you buy: every shop sells an equipment or ring pouch for 1000 gold (a backpack with the tab's item in the corner), and once you buy one the other shops stop selling it.
- Only one of each bag can be carried; extra copies are refused or dropped.

### QoL enhancements
- **Confirm actions:** a tap that would walk somewhere, attack, talk, use stairs or step into danger first shows what will happen, with Go and Cancel. Each action can be switched on or off, and moving and attacking have their own minimum distances. Danger accounts for levitation and immunities.
- **Interrupted path:** when a walk is interrupted and the game shows its resume arrow, the rest of the route and its destination are drawn on the map, the same way Confirm actions shows a path. Can be switched off in Extras → QoL.
- **Enhanced Bestiary:** examining a creature, or opening one in the bestiary, adds a **Stats** button at the bottom (health, accuracy, evasion, damage and armor ranges, attack and move speed, vision, stealth, resistances and immunities to fire, cold, lightning, poison, corrosion, ooze, paralysis and magic, experience, drops, and alignment and state for live creatures) and an **[i]** button in the top right corner listing how far it can see, its special abilities (with the range of each ranged attack or skill, such as how far a prison guard can throw its chain), traits, immunities and resistances, each with an icon. Can be switched off in Extras → QoL.
- **Experience** and **Loot** (separate pages in Extras → QoL): each creature type stops giving experience once your level passes its limit, and stops dropping items 2 levels later. For each, choose Normal, No level limit, Raise the limit (by 1 to 30 levels), Reduced past the limit (5% to 100%), or a Multiplier (10% to 1000%).
- **List everything on a tile:** examining a tile with more than one thing on it, such as a creature on an item or a pile of items, lists each one. Pick an item from a pile to read it, pick it up instead of the top item, or move it with the Floor editor. Items that ended up inside a grave, skeleton or chest after the floor was made, like gold dropped by a creature defeated on a grave, are listed under it. Can be switched off in Extras → QoL.
- **Energize more items:** lets you energize items in alchemy that normally can't be. For now that's the Arcane Stylus, worth 5 energy each. Can be switched off in Extras → QoL.
- **Mageroyal cures everything:** stepping on a Mageroyal removes every harmful status effect (burning, poison, chill, paralysis, charm, ooze, degrade and so on), not just the few the game normally cures. Lost inventory and corruption aren't touched. Works for any creature that steps on one. Can be switched off in Extras → QoL.
- **Reforge hero armor:** the blacksmith can reforge the hero armor the dwarven crown makes with armor of the tier it was before, such as plate armor. The result is always the hero armor: when the other armor has more upgrades, the hero armor takes its upgrades, glyph, augment and curse. Can be switched off in Extras → QoL.
- **Safe gardens:** in garden rooms and secret gardens, enemies don't trample the plants, fire doesn't catch, and enemies leave the garden alone as if they never saw the way in. New enemies don't appear there and golems don't teleport in. Each can be switched off in Extras → QoL.
- **Games in progress:** picking a game on the main menu shows the same preview as Game Saves (the hero, their backpack and the dungeon around them) with its deepest floor, its seed, Continue and Erase. The preview is kept each time the game saves itself during play. Tap the seed to copy it, or to start a new game on it: you pick your hero as usual, with the seed already filled in. The new game takes an empty slot and every other game is kept. Seeds of unfinished games can also be typed in as a custom seed. Both can be switched off in Extras → QoL.
- **Display margins** (Extras → QoL → Display): shrink the game inward from the top, bottom, left and right edges of the screen by a number of pixels each, for phones whose rounded corners, camera hole or gesture bar cover part of the game. The margins are painted black and the game's buttons and windows move inward the same way they do for a notch. Tags (Undo / Redo, Attack Tile, item tags), their settings previews and the main menu's stand-in game screen all stay inside the margins. Applies to every game.
- **Tags editor** (Extras → QoL): shows every tag on screen at once, the game's own Attack, Pick Up, Action and Resume tags included. Tap a tag to open its settings, or press and hold it briefly and then drag it along its edge or onto another edge (position, size, icon and colors where they apply; the game's own tags have position and color).
- **Area effect turns:** examining a tile with fire, webs, electricity or freezing shows how many turns it has left. Spreading gases show the most turns they can last.
- **Reroll Catalyst:** after transforming a magical catalyst at the alchemy table, a **Reroll 5** button under the trinket choices spends 5 energy to show a new set of trinkets. Can be switched off in Extras → QoL.
- **Walk through allies:** when going past an ally is the shorter route to the tile you tapped, the hero swaps places with it and keeps walking, the same as tapping the ally. The hero walks over wards, sharing their tile on the way past without moving or triggering them, the Dried Rose ghost's introduction waits until you tap the ghost yourself, and the walk asks first like any other when movement confirmation is on. Can be switched off in Extras → QoL.
- **Tap unexplored areas:** tapping a blacked-out part of the map you haven't seen yet walks to the reachable explored tile closest to where you tapped, with the usual movement confirmation if it's on. Tapping the black area again keeps the preview open: confirm with Go or by tapping the chosen tile. Can be switched off in Extras → QoL.
- **Empty Quickslot:** when the backpack opens to choose an item for a quickslot, an Empty Quickslot button at the bottom clears that slot and closes the backpack, which also gets you out after tapping an empty quickslot by mistake.
- **Rename window:** a close button in the top right corner of the rename hero window cancels without changing the name.
- **Item Tags** (Extras → QoL): add tags to the screen edge for items you pick from your backpack; tapping a tag uses its item, like a quickslot; items that need a target aim at your last target, and tapping the tag again confirms it. Tap a tag in the list to change its position, size, color, icon, icon color, rotation and opacity, or delete it. Tags follow the kind of item, hide while you carry none, and each game keeps its own item tags (the ones set on the main menu are the starting set for new games). The Icon tab's **Emoji** button lets you use any emoji from your keyboard's emoji panel as the icon, for every kind of tag.
- **Quick Tags** (Extras → QoL): add tags to the screen edge that open an editor window, straight to one of its tabs (Character: Stats, Mods, Talents or Status; Floor: General, Effects or Traps; Inventory, Add an item, Apply a status, Hunger, Teleport, Game Saves, Undo history, Hero stats, Extras menu), or run an action (reveal the map, mark it explored, forget it, reveal or disarm all traps, clear area effects, defeat all enemies, heal fully, remove negative statuses). Each tag has its own position, size, color, icon and opacity like item tags, and each game keeps its own quick tags.
- **All stats on hero info** (Extras → QoL): the hero info window shows all your hero's numbers in place of its strength, health and experience, at the same size, in tabs: Stats (health, experience, strength, accuracy, evasion, damage, armor, attack and move speed, shield), Senses (vision, search range and chance, stealth, luck, enchant power), Mods (ring levels and modifiers you've set), Resist (elements you resist or are immune to) and Run (gold collected, maximum depth and the dungeon seed).
- **Attack Tile button:** a button above the backpack button (its position, size, color, icon and opacity can be changed with Attack Tile Tag Style in Extras → QoL → Toolbar) that lets you attack any tile in reach of your weapon except a chasm, walls and doors included. A creature there is attacked even if it is hiding, so you can hit a mimic first, often as a surprise attack. An empty tile gets a swing that takes the time of an attack. Tap the button again to cancel. With **Enchantments affect the tile** on, a Blazing, Chilling, Blooming or Shocking weapon rolls its normal chance and sets the tile alight (doors, bookshelves and grass burn away), freezes it, grows grass there or sends lightning from it that arcs between creatures, further through water. Both are switches in Extras → QoL → Toolbar.
- **Shopkeeper:**
  - Banish Enemies: enemies that walk into the shop are thrown out and stay away for 20 turns.
  - Fearless: he isn't scared off by enemies fighting in the shop, or by you carrying the Amulet back up.
  - Immune: gas, fire and cold don't drive him away.
  - Passive: your attacks only earn a remark, and thrown weapons go up for sale.
  - Lenient: two warnings, then you're thrown out until you apologize with gold or a potion of healing. Getting caught stealing means paying for the item or leaving.
  - Shop window: buy back up to 24 sold items, newest first, with an "items sold" counter against the Sold Items setting. Every sold item is kept in the save, so raising the setting later brings older ones back. Each row shows the item in an inventory slot tinted the way the backpack shows cursed and unidentified items, its price beside a gold icon and an [i] to examine it.
  - Selling: tapping an item shows its details and price with Sell (Sell 1 and Sell all for stacks) and Back.
- **Quantum Chest:** a chest beside the exit of every beaten boss floor. Every chest opens the same storage of 1, 2 or 3 pages of 25 items. Tap an item for its details and Take Out or Store Item, or turn on Quick Move.
- **Backpack** (window in Extras → QoL): 4 to 8 rows of items in every bag, and an optional extra page for each tab.
- **Extra toolbar item slots:** a row of extra quickslots across the full width of the screen, below the toolbar and lined up with the slots above. With the game's Quickslot Swapper setting on, there's no extra row: the swap button appears beside your quickslots and swaps to the extra slots instead.

### Save management
- **Export saves** and **Import saves** on the main menu Extras and the app icon shortcuts (long-press the icon) back up and restore every save as one zip file.
- **Game Saves** (Extras and the in-game menu): keep up to 10 saves of the game you're playing and load any of them. Once there are 10, Save Now asks first and then replaces the oldest unlocked save. **Auto save on new floors** (off by default) saves each time you arrive on a floor, including going into or out of a side area like the Blacksmith's mine; auto saves start with "Auto:", the latest 5 are kept, and they don't count toward the 10. Restoring a save or undo step shows its full preview first. **Lock** a save to keep it: locked saves are marked with a key, don't count toward the 10, and can't be deleted until you unlock them. If a game's save file can't be read, for example after the phone shut down mid-save, the title screen calls it a damaged game and offers **Restore a Save** to put one of its saves back into its slot, and **Restore an Undo Step** when it has kept undo steps (even with no Game Saves) (the same option is offered for finished games whose slot is free). When a game ends and you delete its saves, you're asked separately whether to delete its locked saves too; Clean Up Saves leaves locked saves alone. Tapping a save shows it the way undo mode shows a step: the hero as they were (portrait for talents, health, experience, level and status icons), a **Backpack** button showing what they carried, the depth and turn, the last game messages and the dungeon around them (tap for a map of the floor), with **Load**, **Delete** and **Back** buttons. In landscape the picture sits beside the rest. Each game's saves are kept in their own folder named after its slot and seed. When a game ends, the title screen asks whether to delete or keep its saves, and **Clean Up Saves** removes any you kept. Each save keeps a picture of the 11×11 tiles around the hero, read from the game's own drawing as it happens (just the dungeon, without the game's buttons or windows, and nothing outside the game), plus a small copy of the hero, so its preview opens without rebuilding anything. **Auto save on new floors** is in Game Saves for the current game, and in Extras on the main menu as the default for new games.
- **Undo / Redo** (Extras → General → Saves, off until switched on): a toolbar tag opens undo mode, with Undo on the left, Done in the middle and Redo on the right, above the toolbar. Undo and Redo pick an earlier or later step without loading it: undo mode shows that step drawn with the game's own tiles and sprites: the 9×9 tiles around your hero with the creatures and items you could see, or (tap it) a map of the explored floor with you, creatures and items marked. Everything sits in a fixed panel that never shifts, with **Cancel** above it to close undo mode without loading. At the top left is the hero as they were at that step: portrait (tap for their talents), level, health and experience bars, and status icons (tap one for its details and turns left), with a **Backpack** button below that shows everything they carried (tap an item for its details; the undo buttons are hidden meanwhile and **Back** sits where Cancel is). The step number, depth and turn sit small in the top right. Below are a line saying whether you're on that step or need to tap Done to load it, up to four game messages from that action in their usual colors, and the 11×11 picture with gases, fire and webs shown. While undo mode is open, taps on the game are ignored so you can't move by accident; the menu button still works and closes undo mode. **Done** loads the step you picked (or just closes undo mode if you're still on the current step). A **History** button above Done lists every kept step, newest first, with its depth, turn and first message; tap one to pick it. Each step keeps only a few kilobytes for this, copied from the game when the step is taken. A copy of the game is kept each time your hero is ready to act. The history survives closing and reopening the game: each step is written to the app's private storage in the background right after it's taken (never into your save folder or exports), and a game's kept history is removed when the game is deleted or you delete its saves. Choose how much history to keep (a number of actions, this floor, or unlimited), whether it carries across floors and whether it works during boss fights. When you die, an **Undo** button below New Game and Menu takes you back to just before the action that killed you; the page also shows how long each copy takes. **Tag Style** sets the tag's screen edge and distance along it, its width, height and color, its icon (any icon in the game, in a scrollable list with category filters), icon size, icon color and icon rotation, and the opacity of the tag and icon (linked or separate). While the page is open in a game, faded outlines show where the game's own Attack, Pick Up, Action and Resume buttons appear when needed, so tags can be kept clear of them. On the main menu, a stand-in game screen (status pane, toolbar and all your tags) is shown behind the page. On the top and left edges the tag turns to face its edge.
- **The game's own Backup & Restore** (4.0.3 and later, in the game's settings): before restoring a backup, which would delete every game in progress, you choose whether to keep your games in progress or remove them as the game does.
- Options when patching:
  - **Public save folder:** saves are stored in a folder you can open with any file manager (Documents/ShatteredPixelDungeon by default).
  - **Uncompressed saves:** save files are plain JSON you can edit in any text editor.
  - **Save file access:** shows the game's private save folder in the system file picker and Files app.

### Supporter options
Keep your Silver, Golden or Shattered supporter rewards and hide the Support button on the title screen (Extras → Unlocks). This is meant for supporters keeping what they paid for. Please support the developer. Google Play version only.

### Teleport
- **Teleport** in the in-game menu and **Teleport to...** in the Adventuring Notes: travel to any floor, arriving at its entrance or exit. Tapping a floor number in the Adventuring Notes asks to teleport there.
- **Teleport Here** for your hero in the floor editor and on tile examine windows, with a warning before landing on an active trap.
- **Teleport** for creatures in the enemy editor.
- Can be switched off in Extras → Editors.

### Unlock all
Show all heroes, guide books, intros and lore, catalog items and bestiary entries as unlocked (Extras → Unlocks). Your save is not changed, so switching a toggle off brings back your real progress.

### Shared
- Number prompts open the phone's number keyboard, with a minus key where the value can be negative.
- Unlock toggles, editor switches and other patch settings are stored separately from the game's own settings.
- The patches never add their own item or bag types to your save, so a save still loads if a patch is removed.
- Custom icons, such as the Equipment tab's, are PNG files in `patches/src/main/resources/cloverlord/icons`, added to the game with the patches and listed in that folder's `index.txt`. Tags and other icon choices can use one as `CUSTOM:name`.

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.


#### Making a custom icon
`tools/merge_icons.py` layers pictures into a new icon and saves it with the others. A layer is a PNG, a part of one (`file.png@x,y,width,height`) or a cell of one of the game's sprite sheets (`items:column,row`, `icons:column,row`, read from the game's APK), fitted into a box of the icon (`SIZE` or `WIDTHxHEIGHT`), with options: `turn=DEGREES` turns it first, `solid` leaves out the game's see-through shadow outline, `edge=RRGGBB` paints an even rim around it, and `recolor=RRGGBB:RRGGBB,...` swaps colors, such as a brighter hilt. For example, the Equipment tab icon, the round shield with an upright sword in front of its right side:

```bash
python3 tools/merge_icons.py equipment --apk spd.apk --layer items:3,7 1 2 11 solid edge=9a9a9a --layer items:0,6 10 1 4x14 turn=45 solid recolor=827b00:e0c040,59551b:a08a28,8e8e8e:8890a0,737373:8890a0,616161:5a6070
```

## 📜 License

Cloverlord Patches are licensed under the [GNU General Public License v3.0](LICENSE)
