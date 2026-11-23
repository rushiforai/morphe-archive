# Статичний аудит (BUILD001)

Ціль: realme Link 5.8.811.2814, package com.realme.link; перевірена APK SHA-256:
d1f2a5d8f8fc0d6c4098fb8aff6ec830af42e92ffd9822563f5c8660a650a2ce.

У classes40.dex виявлено:
- HeadsetManagerProxy.J3(Device, SettingsInfo, ISettingsCallback): установка налаштувань
- HeadsetManagerProxy.x(Device, int, int, ISettingsCallback): запит налаштувань
- HeadsetManagerProxy.isDeviceConnected(Device)
- HeadsetManager.getInstance()
- SettingsInfo(int, int, int), getSettingType/getSettingKey/getSettingValue
- HeadsetDeviceActivity.R9/Y9: перемикання радіоелементів; S9/X9: перемикачів
- HeadsetDevicePresenter.K0(Device, boolean) / m0(Device): події підключення
- LinkApplication.onCreate()

Схема: перехоплення ручного UI-вибору -> читання оригінального SettingsInfo у J3 ->
збереження налаштувань за MAC -> на підключення прочитати поточне значення через x ->
за відмінності одноразово відновити J3 -> верифікувати повторним x.

Увага: обфускація, альтернативні UI-екрани та специфічні Bluetooth-бекенди можуть
обходити перехоплення. Без журналу реального підключення не можна заявляти, що ANC
і Game Mode відновлюються на Buds Air 7.

Не блокувати HeadsetDevicePresenter.F0: його роль у скиданні ANC/Game Mode не доведена.
Не змінювати firmware/OTA. Нагадування про заряд та одиночний дотик не реалізовано.

Оригінальний hxreborn v1.80.0:
https://github.com/hxreborn/morphe-patches/tree/v1.80.0
Коміт: 83839f596c9c7d8555c97809c34c2daabde03ec7.
Ліцензія GPL-3.0-only, зберегти notices.


## BUILD003: прибирання AI-блоку та демонстраційного розділу на головному екрані

У наданому APK 5.8.811.2814 декодовано бінарний AXML `res/layout/fragment_main.xml`. Точні resource-ID:

- `0x7f0a002f` → `@id/MainAdvertiseView` (`com.realme.link.widgets.MainAdvertiseView`)
- `0x7f0a097d` → `@id/rl_virtual_device_title` (контейнер заголовка «Віртуальне використання»)
- `0x7f0a08fc` → `@id/recycle_view_virtual_device` (список віртуальних пристроїв)
- `0x7f0a046c` → `@id/homeRecyclerView` (список реальних пристроїв) — **без змін**
- `0x7f130d68` → `@string/link_virtual_experience`

Патч обмежено `fragment_main.xml`, атрибути `visibility=gone` і розміри 0dp для трьох цільових вузлів. Не видаляти вузли або ID: збереження runtime binding. Якщо Morphe resource decode не знаходить рівно один вузол за ID, падати з помилкою, а не переписувати інші layout. Зміни не зачіпають окремі екрани налаштувань навушників або годинника. Програмну появу рекламних віджетів додатково обмежено їхнім нульовим розміром.
