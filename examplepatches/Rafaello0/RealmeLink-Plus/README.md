# RealmeLink Plus

![RealmeLink Plus robotic capybara](patches-bundle.png)

**Автор: RaFaeLL0** (оригінальні AMOLED/session патчі hxreborn, GPL-3.0-only).

[Додати RealmeLink Plus у Morphe](https://morphe.software/add-source?github=Rafaello0/RealmeLink-Plus&name=RealmeLink%20Plus&app=com.realme.link)

Посилання працює як віддалене джерело з автоматичним оновленням, **лише коли цей репозиторій публічний**, а GitHub Release та `patches-bundle.json` доступні без авторизації.
Важливо: локальні `.mpp` через Sources → Local не оновлюються автоматично.


Локальні патчі Morphe для realme Link `com.realme.link` 5.8.811.2814.

## Склад
- Збереження вручну вибраного ANC / Transparency / Off
- Збереження Game Mode
- **Clean home screen** — приховування рекламного / AI-блоку та розділу «Віртуальне використання» з демонстраційними пристроями; справжні підключені пристрої залишаються
- Оригінальні `AMOLED dark theme` та `Bypass session expiry` із hxreborn v1.80.0 (GPL-3.0-only)

Вихідний код hxreborn завантажується при складанні з зафіксованого коміту
`83839f596c9c7d8555c97809c34c2daabde03ec7`.
Всі функції залишаються окремими пунктами вибору в Morphe.

**Статус:** код BUILD003 має симуляційні Java-тести режимів. Патч головного екрана перевірено за ресурсами APK 5.8.811.2814, але фактичний вигляд зміненого APK і поведінка навушників ще потребують перевірки. Збірка має завершуватися помилкою, а не публікувати порожній артефакт.

## Підтримка режимів для окремих навушників

Виберіть шумозаглушення / прозорість / вимкнено та ігровий режим штатними елементами realme Link. На екрані навушників кнопка «Підтримка режимів» доступна при відкритті. У меню виберіть збережений комплект за MAC-адресою; перемикачі незалежні та доступні навіть коли цей комплект не підключено. Вибрані значення та перемикачі зберігаються локально після перезапуску. Вимкнення підтримки не змінює поточний режим.

Під час повторного підключення виконуються до трьох обмежених циклів читання/порівняння/відновлення/перевірки, включно з пізнім скиданням режиму після готовності навушників. Невідомі значення не спричиняють запису. Для підвищеної надійності в меню комплекту натисніть «Дозволити фонове відновлення» і підтвердьте системну прив’язку. CompanionDeviceService відстежує лише явно вибраний комплект; Android 16 використовує API DevicePresenceEvent, Android 13–15 — попередній API. Вимкнути Companion-пробудження можна в тому самому меню. Патч використовує глобальний callback realme Link та системні Bluetooth ACL-події. Холодний запуск повторює пошук пристрою до чотирьох разів, завершує фонове завдання після перевірок і відкидає запізнілі або суперечливі відповіді. Для звичайного завершення процесу додано manifest receiver і короткочасне завдання JobScheduler; штатний об’єкт пристрою отримується з бази realme Link. Відновлення є best effort: Android може відкласти завдання, а після примусової зупинки (Force stop) не гарантує запуск до ручного відкриття. Потрібна перевірка на фізичних навушниках. Не змінюється прошивка або OTA.

## Одиночне торкання (експериментально)

У Morphe можна окремо увімкнути **Expose single tap (experimental)**. Патч використовує штатний ItemFactory.N/M і відомі vendor-значення Play/Pause та Off. Додає рядок лише до лівого/правого жестового меню, де подвійне торкання вже підтримує обидві дії; зберігає інші жести та відомі обмеження версій/регіонів. Автоматичного запису немає. Якщо прошивка не приймає одиночне торкання, вимкніть цей патч: наявність рядка не доводить підтримку апаратурою.

У меню підтримки режимів є «Канали сповіщень realme Link»: показує штатні канали і кількість активних сповіщень, відкриває Android-налаштування вибраного каналу. Не вимикає канали автоматично, не впливає на голосові сигнали прошивки або захист OTA.

## Збірка
- GitHub: **Actions → Build Morphe MPP → Run workflow**. Завантажити `.mpp` у Artifacts успішного запуску.
- Windows: PowerShell 7, Git, JDK 21. Виконати `BUILD.cmd`.
- Морфе: **Sources → + → Local** та вибрати `.mpp`.
- Непатчений оригінальний XAPK потрібної версії, а не APK з hxreborn, для повторного патчування.

Попередження: змінена підписом збірка може вимагати перевстановлення; зробіть резервну копію даних перед заміною. Не публікуйте вихідний APK або токени. Немає доступу до прошивки / OTA.

Аудит: `reports/RESEARCH.md`. Це незалежна модифікація, не пов'язана з realme чи Morphe.

## Ліцензія
Нові модифікації GPL-3.0-only; оригінальні патчі hxreborn також GPL-3.0-only. Зберігати copyright, LICENSE і NOTICE upstream.

## Доступ до GitHub Packages (якщо Gradle не знаходить Morphe)

Плагін Morphe `app.morphe.patches:2.1.0` поширюється через GitHub Packages.
Стандартний `GITHUB_TOKEN` приватного репозиторію може не мати доступу до пакетів чужої організації.
Створіть **Personal access token (classic)** тільки з правом `read:packages` у https://github.com/settings/tokens.
У GitHub репозиторію: **Settings → Secrets and variables → Actions → New repository secret**:

- Name: `MORPHE_PACKAGES_TOKEN`
- Secret: створений classic PAT (не пишіть його у чат, вихідний код чи логи).

Після збереження: **Actions → Build Morphe MPP → Run workflow**.
Успішний артефакт: `RealmeLink-Plus_build003_MPP` з файлом `RealmeLink-Plus_build003.mpp`.

Це не потрібно для **встановлення** готового `.mpp` у Morphe, лише для **складання**.


## Помилка «Метадані патча не знайдено»

**Важливо: використовуй Local, а не GitHub/Remote.**

1. На сторінці GitHub Actions вибери успішний Build Morphe MPP.
2. У розділі Artifacts завантаж ZIP `RealmeLink-Plus_build003_MPP`.
3. Розпакуй ZIP. Файл усередині має закінчуватися саме на `.mpp`.
4. Morphe → Sources → + → **Local** → вибери `RealmeLink-Plus_build003.mpp`.
5. Якщо раніше імпортував BUILD001, прибери це локальне джерело, тоді імпортуй BUILD003.

Репозиторій публічний. Вставляння посилання
`https://github.com/Rafaello0/RealmeLink-Plus` до вкладки Remote не працює:
Morphe не має доступу до приватного репозиторію, і
у ньому не опубліковано `patches-bundle.json` та реліз із `.mpp`.
Успішний GitHub Actions artifact НЕ є Morphe Remote patch source.

BUILD001 хибно представлявся як `hxreborn’s patches v1.80.0` і містив
сотні нецільових патчів. BUILD003 виправляє назву пакета на
`RealmeLink Plus v0.3.0`, залишає тільки 5 патчів для realme Link,
а також автоматично перевіряє метадані локального `.mpp`.


## Головний екран (BUILD003)

Патч **Clean home screen** окремо вмикається у списку Morphe та прибирає лише:

- `MainAdvertiseView` — рекламний блок / банери AI;
- `rl_virtual_device_title` — заголовок «Віртуальне використання»;
- `recycle_view_virtual_device` — демонстраційні картки годинника й навушників.

`homeRecyclerView` зі справжніми пристроями й налаштуваннями не змінюється. ID прихованих елементів залишаються, щоб не ламати програмне прив'язування Views. Усі зміни обмежені `res/layout/fragment_main.xml` і підтримуваною версією APK 5.8.811.2814.

Під час оновлення до BUILD003 видали старе локальне джерело BUILD002 із Morphe та додай новий `.mpp`, потім патч оригінальний XAPK заново.


## Автоматичне оновлення через GitHub Releases

При кожному успішному збиранні `main` workflow створює нову версію `v0.3.<run_number>`, завантажує `.mpp` як asset у GitHub Release і **лише після перевірки** записує `patches-bundle.json` (поля `version`, `download_url`, `created_at`, `description`). Саме цей JSON Morphe використовує для перевірки оновлень. Коміти тільки з метаданими ігноруються CI, щоб не створювати нескінченні збірки.

Репозиторій публічний. Джерело Morphe додається за посиланням у верхній частині README, а CI публікує `.mpp` та `patches-bundle.json`.

Перевірка після публікації: [patches-bundle.json](https://raw.githubusercontent.com/Rafaello0/RealmeLink-Plus/main/patches-bundle.json), [Releases](https://github.com/Rafaello0/RealmeLink-Plus/releases) і [встановлення](<https://morphe.software/add-source?github=Rafaello0/RealmeLink-Plus&name=RealmeLink%20Plus&app=com.realme.link>).


## Важливо: не патчити вже модифікований APK

Morphe застосовує патчі до **оригінального, непатченого** APK realme Link 5.8.811.2814.
Файл `realme_Link-v5.8.811.2814-hxreborn_s_patches-v1.80.0.apk` — уже модифікований,
в його `resources.arsc` присутні `hx_page`, `hx_surface` і `hx_on_surface`.
Повторне застосування AMOLED-теми та обходу сесії до такого APK може завершитися
`ReLoginToastFingerprint` або `amoledThemeResourcesPatch` error.

У Morphe: **Sources → вимкнути hxreborn для realme Link → залишити RealmeLink Plus**.
Проте цього **недостатньо**, якщо вхідний APK уже пропатчений; потрібен оригінальний.

Перевірка на ПК перед патчингом: `python tools/check_input_apk.py "path/to/realme-link.apk"`.
Exit 1 — точно виявлена раніше застосована тема; exit 0 — індикаторів не знайдено
(але оригінальність підпису та APK не підтверджена).

Для `Bypass session expiry` необов'язковий toast fingerprint тепер не є фатальною
умовою; основне придушення повідомлення про сесію залишено суворо перевірюваним.

Якщо AMOLED все одно завершується помилкою на **оригінальному APK**, потрібно надати
повний журнал із кнопки «Технічні деталі», включно з **першою причиною**
(`Caused by`), а не лише верхнім повідомленням про dependency.


## BUILD028: one-tap limitations and headset screen fixes

The previously added optional experimental Single Tap patch was removed: realme Buds Air7 documentation describes double-tap, triple-tap and touch-and-hold, not single tap. Inserting a menu row does not enable a firmware gesture recognizer. We do not send guessed commands to earbuds.

- Mode-settings entry moved from navigation bottom to upper-right, below the headset title area.
- Headset selection uses the Android Bluetooth alias/name or the realme vendor device name cached per profile; **never displays a MAC**. Duplicate names receive numbered suffixes; unknown names use localized generic labels.
- Physical device behavior and visual position still need verification after patching an original APK. Compatibility tested by CI compilation and Java simulation, not an over-the-air firmware change.

BUILD029 consistency: Morphe bundle manifest declares **five** patches and CI verifies HeadsetProfileNames runtime class and absence of unsupported experimental single-tap injection.
