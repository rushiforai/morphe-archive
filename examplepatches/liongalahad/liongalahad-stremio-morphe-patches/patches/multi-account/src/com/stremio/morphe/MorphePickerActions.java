package com.stremio.morphe;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/** Localized actions shown by the account picker and its PIN gate. */
final class MorphePickerActions {
    static final int RENAME = 0;
    static final int CHANGE_COLOR = 1;
    static final int ADD_PIN = 2;
    static final int REMOVE_PIN = 3;
    static final int REMOVE_ACCOUNT = 4;
    static final int ENTER_PIN = 5;
    private static final int FIELD_COUNT = 6;
    private static final Map<String, String[]> COPY;

    static {
        Map<String, String[]> copy = new HashMap<>();
        add(copy, "ar-AR", "إعادة تسمية", "تغيير اللون", "أضف رقم التعريف الشخصي", "إزالة رقم التعريف الشخصي", "إزالة الحساب", "أدخل رقم التعريف الشخصي");
        add(copy, "be-BY", "Перайменаваць", "Змяніць колер", "Дадаць PIN-код", "Выдаліць PIN-код", "Выдаліць уліковы запіс", "Увядзіце PIN-код");
        add(copy, "bg-BG", "Преименуване", "Промяна на цвета", "Добавете PIN", "Премахване на PIN", "Премахване на акаунт", "Въведете PIN");
        add(copy, "bn-BD", "নাম পরিবর্তন করুন", "রঙ পরিবর্তন করুন", "পিন যোগ করুন", "পিন সরান", "অ্যাকাউন্ট সরান", "পিন লিখুন");
        add(copy, "ca-ES", "Canvia el nom", "Canvia de color", "Afegeix el PIN", "Elimina el PIN", "Elimina el compte", "Introduïu el PIN");
        add(copy, "cs-CZ", "Přejmenovat", "Změnit barvu", "Přidat PIN", "Odstranit PIN", "Odebrat účet", "Zadejte PIN");
        add(copy, "da-DK", "Omdøb", "Skift farve", "Tilføj PIN-kode", "Fjern PIN-kode", "Fjern konto", "Indtast PIN-kode");
        add(copy, "de-DE", "Umbenennen", "Farbe ändern", "PIN hinzufügen", "PIN entfernen", "Konto entfernen", "PIN eingeben");
        add(copy, "el-GR", "Μετονομασία", "Αλλαγή χρώματος", "Προσθήκη PIN", "Αφαίρεση PIN", "Κατάργηση λογαριασμού", "Εισαγάγετε το PIN");
        add(copy, "en-US", "Rename", "Change color", "Add PIN", "Remove PIN", "Remove account", "Enter PIN");
        add(copy, "eo-EO", "Alinomi", "Ŝanĝu koloron", "Aldonu PIN", "Forigi PIN", "Forigi konton", "Enigu PIN");
        add(copy, "es-ES", "Cambiar nombre", "Cambiar color", "Agregar PIN", "Quitar PIN", "Eliminar cuenta", "Introducir PIN");
        add(copy, "et-EE", "Nimeta ümber", "Muuda värvi", "Lisa PIN-kood", "Eemalda PIN-kood", "Eemalda konto", "Sisesta PIN-kood");
        add(copy, "eu-ES", "Aldatu izena", "Aldatu kolorea", "Gehitu PINa", "Kendu PINa", "Kendu kontua", "Sartu PINa");
        add(copy, "fa-IR", "تغییر نام", "تغییر رنگ", "افزودن پین", "حذف پین", "حذف حساب", "پین را وارد کنید");
        add(copy, "fi-FI", "Nimeä uudelleen", "Vaihda väriä", "Lisää PIN-koodi", "Poista PIN", "Poista tili", "Anna PIN-koodi");
        add(copy, "fr-FR", "Renommer", "Changer de couleur", "Ajouter un code PIN", "Supprimer le code PIN", "Supprimer le compte", "Entrez le code PIN");
        add(copy, "he-IL", "שנה שם", "שנה צבע", "הוסף PIN", "הסר PIN", "הסר חשבון", "הזן PIN");
        add(copy, "hi-IN", "नाम बदलें", "रंग बदलें", "पिन जोड़ें", "पिन निकालें", "खाता हटाएँ", "पिन दर्ज करें");
        add(copy, "hr-HR", "Preimenuj", "Promijeni boju", "Dodaj PIN", "Ukloni PIN", "Ukloni račun", "Unesite PIN");
        add(copy, "hu-HU", "Átnevezés", "Szín módosítása", "PIN-kód hozzáadása", "PIN-kód eltávolítása", "Fiók eltávolítása", "Írja be a PIN-kódot");
        add(copy, "id-ID", "Ganti nama", "Ubah warna", "Tambahkan PIN", "Hapus PIN", "Hapus akun", "Masukkan PIN");
        add(copy, "it-IT", "Rinomina", "Cambia colore", "Aggiungi PIN", "Rimuovi PIN", "Rimuovi account", "Inserisci PIN");
        add(copy, "ja-JP", "名前を変更", "色を変更", "PINを追加", "PINを削除", "アカウントを削除", "PINを入力");
        add(copy, "ko-KR", "이름 바꾸기", "색상 변경", "PIN 추가", "PIN 삭제", "계정 삭제", "PIN 입력");
        add(copy, "lt-LT", "Pervardyti", "Keisti spalvą", "Pridėti PIN kodą", "Pašalinti PIN kodą", "Pašalinti paskyrą", "Įveskite PIN kodą");
        add(copy, "mk-MK", "Преименувај", "Промени ја бојата", "Додај PIN", "Отстрани PIN", "Отстрани ја сметката", "Внесете PIN");
        add(copy, "my-BM", "အမည်ပြောင်းပါ", "အရောင်ပြောင်းပါ", "ပင်နံပါတ်ထည့်ပါ", "ပင်နံပါတ်ဖယ်ရှားပါ", "အကောင့်ဖယ်ရှားပါ", "ပင်နံပါတ်ထည့်ပါ");
        add(copy, "nb-NO", "Gi nytt navn", "Bytt farge", "Legg til PIN-kode", "Fjern PIN-kode", "Fjern konto", "Skriv inn PIN");
        add(copy, "ne-NP", "पुन: नामाकरण गर्नुहोस्", "रङ परिवर्तन गर्नुहोस्", "PIN थप्नुहोस्", "PIN हटाउनुहोस्", "खाता हटाउनुहोस्", "PIN प्रविष्ट गर्नुहोस्");
        add(copy, "nl-NL", "Hernoemen", "Kleur wijzigen", "Pincode toevoegen", "Pincode verwijderen", "Account verwijderen", "Voer pincode in");
        add(copy, "nn-NO", "Gje nytt namn", "Byt farge", "Legg til PIN-kode", "Fjern PIN-kode", "Fjern konto", "Skriv inn PIN");
        add(copy, "pa-IN", "ਨਾਮ ਬਦਲੋ", "ਰੰਗ ਬਦਲੋ", "ਪਿੰਨ ਸ਼ਾਮਲ ਕਰੋ", "ਪਿੰਨ ਹਟਾਓ", "ਖਾਤਾ ਹਟਾਓ", "ਪਿੰਨ ਦਾਖਲ ਕਰੋ");
        add(copy, "pl-PL", "Zmień nazwę", "Zmień kolor", "Dodaj PIN", "Usuń PIN", "Usuń konto", "Wprowadź PIN");
        add(copy, "pt-BR", "Renomear", "Mudar cor", "Adicionar PIN", "Remover PIN", "Remover conta", "Insira o PIN");
        add(copy, "pt-PT", "Mudar nome", "Mudar cor", "Adicionar PIN", "Remover PIN", "Remover conta", "Introduza o PIN");
        add(copy, "ro-RO", "Redenumiți", "Schimbați culoarea", "Adăugați codul PIN", "Eliminați codul PIN", "Eliminați contul", "Introduceți codul PIN");
        add(copy, "ru-RU", "Переименовать", "Изменить цвет", "Добавить PIN-код", "Удалить PIN-код", "Удалить аккаунт", "Введите PIN-код");
        add(copy, "sk-SK", "Premenovať", "Zmeniť farbu", "Pridať PIN", "Odstrániť PIN", "Odstrániť účet", "Zadajte PIN");
        add(copy, "sl-SL", "Preimenuj", "Spremeni barvo", "Dodaj PIN", "Odstrani PIN", "Odstrani račun", "Vnesite PIN");
        add(copy, "sr-RS", "Преименуј", "Промени боју", "Додај ПИН", "Уклони ПИН", "Уклони налог", "Унесите ПИН");
        add(copy, "sv-SE", "Byt namn", "Ändra färg", "Lägg till PIN-kod", "Ta bort PIN-kod", "Ta bort konto", "Ange PIN-kod");
        add(copy, "ta-IN", "மறுபெயரிடவும்", "நிறத்தை மாற்றவும்", "பின்னைச் சேர்க்கவும்", "பின்னை அகற்றவும்", "கணக்கை அகற்றவும்", "பின்னை உள்ளிடவும்");
        add(copy, "te-IN", "పేరు మార్చండి", "రంగు మార్చండి", "పిన్ జోడించండి", "PINని తీసివేయండి", "ఖాతాను తీసివేయండి", "PINని నమోదు చేయండి");
        add(copy, "tr-TR", "Yeniden adlandır", "Rengi değiştir", "PIN ekle", "PIN'i kaldır", "Hesabı kaldır", "PIN'i girin");
        add(copy, "uk-UA", "Перейменувати", "Змінити колір", "Додати PIN-код", "Видалити PIN-код", "Видалити обліковий запис", "Введіть PIN-код");
        add(copy, "ur-PK", "نام تبدیل کریں", "رنگ تبدیل کریں", "PIN شامل کریں", "PIN ہٹائیں", "اکاؤنٹ ہٹائیں", "PIN درج کریں");
        add(copy, "vi-VN", "Đổi tên", "Thay đổi màu sắc", "Thêm mã PIN", "Xóa mã PIN", "Xóa tài khoản", "Nhập mã PIN");
        add(copy, "zh-CN", "重命名", "更改颜色", "添加 PIN 码", "删除 PIN 码", "删除账户", "输入 PIN 码");
        add(copy, "zh-HK", "重新命名", "更改顏色", "新增 PIN 碼", "刪除 PIN 碼", "刪除帳戶", "輸入 PIN 碼");
        add(copy, "zh-TW", "重新命名", "變更顏色", "新增 PIN 碼", "刪除 PIN 碼", "刪除帳戶", "輸入 PIN 碼");
        COPY = Collections.unmodifiableMap(copy);
    }

    private MorphePickerActions() {}

    static String get(String locale, int field, String fallback) {
        String[] values = COPY.get(locale);
        return values == null || field < 0 || field >= values.length || values[field].trim().isEmpty()
                ? fallback : values[field];
    }

    static boolean hasCompleteLocale(String locale) {
        String[] values = COPY.get(locale);
        if (values == null || values.length != FIELD_COUNT) return false;
        for (String value : values) if (value == null || value.trim().isEmpty()) return false;
        return true;
    }

    private static void add(Map<String, String[]> copy, String locale, String... values) {
        if (values.length != FIELD_COUNT) throw new IllegalArgumentException(locale);
        copy.put(locale, values);
    }
}
