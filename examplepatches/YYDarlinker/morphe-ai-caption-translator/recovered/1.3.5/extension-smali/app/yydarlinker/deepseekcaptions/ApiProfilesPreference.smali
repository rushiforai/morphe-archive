.class public final Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;
.super Landroid/preference/Preference;
.source "ApiProfilesPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;
    }
.end annotation


# instance fields
.field private dialog:Landroid/app/Dialog;

.field private expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

.field private listBody:Landroid/widget/LinearLayout;

.field private listDialog:Landroid/app/Dialog;

.field private renameEditor:Landroid/widget/EditText;

.field private renameOriginal:Ljava/lang/String;

.field private final rows:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$CMi96veVuNScXSicAGfe8BteeTg(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$showProfiles$3(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$EXWjgvS64i1bdRWbxuT0Niv7DkA(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/view/View;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$addRow$5(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$IZHjF0iBy4DbMXY_hq3DEOcGL7Q(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/widget/EditText;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$beginRename$10(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/widget/EditText;)V

    return-void
.end method

.method public static synthetic $r8$lambda$L7jfHt4EkpfdTc8Zp9EbRnv2HbU(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/widget/EditText;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$beginRename$13(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/widget/EditText;)V

    return-void
.end method

.method public static synthetic $r8$lambda$LL5o1bOiwdC1WgzmSc-h039TiUg(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/view/View;)Z
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$addRow$6(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$O0zrG5B7R4aM2UDYtlC3gi7XGR4(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$beginDelete$14(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    return-void
.end method

.method public static synthetic $r8$lambda$OvDpU733kqC6cq8MD-bVZZHCB-0(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/widget/EditText;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$beginRename$11(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/widget/EditText;)V

    return-void
.end method

.method public static synthetic $r8$lambda$SMzDUS1kaIzZlh2-D6sw1L58Ufk(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;)V
    .registers 1

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$showProfiles$2()V

    return-void
.end method

.method public static synthetic $r8$lambda$SsXZCzLU_Tc6bt1D_uSN139bwbo(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Landroid/app/Dialog;Landroid/content/DialogInterface;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$show$0(Landroid/app/Dialog;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Va4WawGxKUjiVFwy5JqG2ewTa78(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;)V
    .registers 1

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$addProfile$16()V

    return-void
.end method

.method public static synthetic $r8$lambda$Wb7KLz5_MsgKJoRwiyXSplwoBTE(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$showActions$8(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    return-void
.end method

.method public static synthetic $r8$lambda$aH4dCmpqwKp7HBpQHBCmenhJpHA(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Ljava/lang/String;Landroid/view/View;)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$addRow$4(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$cdbfCYz4Hb_VS7As0bkjppvtcwA(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$reveal$7(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    return-void
.end method

.method public static synthetic $r8$lambda$e3v3-nMoWYzyPdPbfXjrpD12u7s(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$beginDelete$15(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$jEOUNnPSIAUA8tD8YbLbdwUyIlI(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Landroid/widget/EditText;)V
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$addProfile$17(Landroid/widget/EditText;)V

    return-void
.end method

.method public static synthetic $r8$lambda$uBbzIXZAbGXemlRzDaRQ-OJIasc(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$showActions$9(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    return-void
.end method

.method public static synthetic $r8$lambda$ud6nbYZExpTu73vmmE4p8PtZ96k(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$clearCurrentKey$18(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcolumn(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;)Landroid/widget/LinearLayout;
    .registers 1

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->column()Landroid/widget/LinearLayout;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mtext(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 33
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 20
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->rows:Ljava/util/LinkedHashMap;

    .line 23
    const-string p1, ""

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameOriginal:Ljava/lang/String;

    .line 33
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 34
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->rows:Ljava/util/LinkedHashMap;

    .line 23
    const-string p1, ""

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameOriginal:Ljava/lang/String;

    .line 34
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 35
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 20
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->rows:Ljava/util/LinkedHashMap;

    .line 23
    const-string p1, ""

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameOriginal:Ljava/lang/String;

    .line 35
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 36
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 20
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->rows:Ljava/util/LinkedHashMap;

    .line 23
    const-string p1, ""

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameOriginal:Ljava/lang/String;

    .line 36
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->init()V

    return-void
.end method

.method private action(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;
    .registers 6

    .line 78
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->styleAction(Landroid/widget/TextView;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda0;

    invoke-direct {p0, p3}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, -0x1

    const/4 p3, -0x2

    invoke-direct {p0, p2, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private addProfile()V
    .registers 7

    .line 252
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->column()Landroid/widget/LinearLayout;

    move-result-object v0

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;-><init>(Landroid/content/Context;)V

    .line 253
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->editor(Landroid/widget/EditText;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSingleLine(Z)V

    const-string v3, "profile_name"

    invoke-direct {p0, v3}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 254
    new-array v2, v2, [Landroid/text/InputFilter;

    new-instance v3, Landroid/text/InputFilter$LengthFilter;

    const/16 v4, 0x3c

    invoke-direct {v3, v4}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 255
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->defaultName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 256
    const-string v2, "profile_new_summary"

    invoke-direct {p0, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->message(Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 257
    new-instance v2, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;-><init>(Landroid/content/Context;)V

    .line 258
    const-string v3, "cancel"

    invoke-direct {p0, v3}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda10;

    invoke-direct {v5, p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda10;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;)V

    invoke-virtual {v2, v4, v5}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->add(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 259
    const-string v4, "profile_save"

    invoke-direct {p0, v4}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda11;

    invoke-direct {v5, p0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda11;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Landroid/widget/EditText;)V

    invoke-virtual {v2, v4, v5}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->addPrimary(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 269
    const-string v1, "profile_add"

    invoke-direct {p0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, v0, v3, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->show(Ljava/lang/String;Landroid/widget/LinearLayout;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method private addRow(Ljava/lang/String;)V
    .registers 11

    .line 114
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    invoke-direct {v0, p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Ljava/lang/String;)V

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->rows:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->root:Landroid/widget/LinearLayout;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "profile_row:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->more:Landroid/widget/ImageButton;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "profile_more:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V

    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "profile_panel:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 116
    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->header:Landroid/widget/LinearLayout;

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->name:Landroid/widget/TextView;

    invoke-direct {p0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->styleAction(Landroid/widget/TextView;)V

    .line 117
    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->more:Landroid/widget/ImageButton;

    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->more:Landroid/widget/ImageButton;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/ImageButton;->setPadding(IIII)V

    .line 118
    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->more:Landroid/widget/ImageButton;

    new-instance v3, Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result v4

    const/16 v5, 0x18

    invoke-static {v4, v5}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->tint(II)I

    move-result v4

    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    new-instance v5, Landroid/graphics/drawable/ColorDrawable;

    const/4 v6, -0x1

    invoke-direct {v5, v6}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/4 v7, 0x0

    invoke-direct {v3, v4, v7, v5}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 120
    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->header:Landroid/widget/LinearLayout;

    iget-object v3, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->name:Landroid/widget/TextView;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v7, -0x2

    invoke-direct {v4, v2, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 121
    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->header:Landroid/widget/LinearLayout;

    iget-object v3, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->more:Landroid/widget/ImageButton;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x30

    invoke-direct {p0, v5}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dp(I)I

    move-result v8

    invoke-direct {p0, v5}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dp(I)I

    move-result v5

    invoke-direct {v4, v8, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->root:Landroid/widget/LinearLayout;

    iget-object v3, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->header:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    const/16 v3, 0xc

    invoke-direct {p0, v3}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dp(I)I

    move-result v4

    invoke-direct {p0, v3}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dp(I)I

    move-result v3

    const/16 v5, 0xa

    invoke-direct {p0, v5}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dp(I)I

    move-result v5

    invoke-virtual {v1, v4, v2, v3, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 124
    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->root:Landroid/widget/LinearLayout;

    iget-object v2, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 125
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->listBody:Landroid/widget/LinearLayout;

    iget-object v2, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->root:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 126
    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->name:Landroid/widget/TextView;

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda18;

    invoke-direct {v2, p0, v0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda18;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    iget-object p1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->more:Landroid/widget/ImageButton;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda1;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    invoke-virtual {p1, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 131
    iget-object p1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->name:Landroid/widget/TextView;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda2;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 132
    iget-object p1, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->name:Landroid/widget/TextView;

    new-instance v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$1;

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$1;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    return-void
.end method

.method private beginDelete(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V
    .registers 7

    .line 228
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->current(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Z

    move-result v0

    if-eqz v0, :cond_79

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    if-eq v0, p1, :cond_b

    goto :goto_79

    .line 229
    :cond_b
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_1e

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->showActions(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    return-void

    .line 230
    :cond_1e
    iget-object v0, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->refreshNames()V

    .line 232
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->deletionContext(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Ljava/lang/String;

    move-result-object v0

    .line 233
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->strip(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;

    move-result-object v1

    .line 234
    const-string v2, "profile_keep"

    invoke-direct {p0, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda14;

    invoke-direct {v3, p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda14;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    invoke-virtual {v1, v2, v3}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->add(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 235
    const-string v2, "profile_confirm_delete"

    invoke-direct {p0, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda15;

    invoke-direct {v4, p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda15;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Ljava/lang/String;)V

    invoke-virtual {v1, v3, v4}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->addPrimary(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    .line 243
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v2

    iget-object v3, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 244
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->reveal(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    :cond_79
    :goto_79
    return-void
.end method

.method private beginRename(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V
    .registers 8

    .line 194
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->current(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Z

    move-result v0

    if-eqz v0, :cond_a8

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    if-eq v0, p1, :cond_c

    goto/16 :goto_a8

    .line 195
    :cond_c
    iget-object v0, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 196
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->editor(Landroid/widget/EditText;)V

    const/4 v1, 0x1

    .line 197
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    const-string v2, "profile_name"

    invoke-direct {p0, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-direct {p0, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 198
    new-array v1, v1, [Landroid/text/InputFilter;

    new-instance v2, Landroid/text/InputFilter$LengthFilter;

    const/16 v3, 0x3c

    invoke-direct {v2, v3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 199
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v1

    iget-object v2, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameOriginal:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Landroid/widget/EditText;->selectAll()V

    .line 200
    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameEditor:Landroid/widget/EditText;

    iget-object v1, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v2, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 201
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->strip(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;

    move-result-object v1

    const/16 v2, 0x8

    invoke-direct {p0, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dp(I)I

    move-result v2

    invoke-virtual {v1, v3, v2, v3, v3}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->setPadding(IIII)V

    .line 202
    const-string v2, "cancel"

    invoke-direct {p0, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda4;

    invoke-direct {v4, p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda4;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/widget/EditText;)V

    invoke-virtual {v1, v2, v4}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->add(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 203
    new-instance v2, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda5;

    invoke-direct {v2, p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda5;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/widget/EditText;)V

    .line 210
    const-string v4, "profile_save"

    invoke-direct {p0, v4}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4, v2}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->addPrimary(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    const/4 v1, 0x6

    .line 211
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 212
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda6;

    invoke-direct {v1, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda6;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 214
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dialog:Landroid/app/Dialog;

    invoke-virtual {v1, v3}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 215
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda7;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/widget/EditText;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    :cond_a8
    :goto_a8
    return-void
.end method

.method private close()V
    .registers 2

    .line 63
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dialog:Landroid/app/Dialog;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_7
    const/4 v0, 0x0

    .line 64
    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dialog:Landroid/app/Dialog;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->notifyChanged()V

    return-void
.end method

.method private collapse()V
    .registers 3

    .line 161
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->endRename()V

    .line 162
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    if-eqz v0, :cond_27

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->root:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setClipToOutline(Z)V

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->root:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    .line 163
    :cond_27
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->refreshNames()V

    return-void
.end method

.method private column()Landroid/widget/LinearLayout;
    .registers 2

    .line 40
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    return-object v0
.end method

.method private current(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Z
    .registers 4

    .line 84
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dialog:Landroid/app/Dialog;

    if-eqz v0, :cond_2a

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->listDialog:Landroid/app/Dialog;

    if-ne v0, v1, :cond_2a

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2a

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->rows:Ljava/util/LinkedHashMap;

    iget-object v1, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_2a

    .line 85
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object p0

    iget-object p1, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2a

    const/4 p0, 0x1

    return p0

    :cond_2a
    const/4 p0, 0x0

    return p0
.end method

.method private defaultName()Ljava/lang/String;
    .registers 4

    .line 248
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p0

    const/4 v0, 0x1

    .line 249
    :goto_d
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "API "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2e

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2e
    add-int/lit8 v0, v0, 0x1

    goto :goto_d
.end method

.method private deletionContext(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Ljava/lang/String;
    .registers 4

    .line 223
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v0

    .line 224
    iget-object p1, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->id:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 225
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\n"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private dirty()Z
    .registers 2

    .line 87
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameEditor:Landroid/widget/EditText;

    if-eqz v0, :cond_16

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameOriginal:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method private dp(I)I
    .registers 2

    .line 39
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    int-to-float p1, p1

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result p0

    return p0
.end method

.method private endRename()V
    .registers 5

    .line 166
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameEditor:Landroid/widget/EditText;

    const/4 v1, 0x0

    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameEditor:Landroid/widget/EditText;

    const-string v1, ""

    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameOriginal:Ljava/lang/String;

    if-eqz v0, :cond_2a

    .line 168
    invoke-virtual {v0}, Landroid/widget/EditText;->hasFocus()Z

    move-result v1

    if-eqz v1, :cond_27

    .line 169
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    if-eqz v1, :cond_27

    .line 170
    invoke-virtual {v0}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 172
    :cond_27
    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 174
    :cond_2a
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dialog:Landroid/app/Dialog;

    if-eqz p0, :cond_32

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    :cond_32
    return-void
.end method

.method private error(Ljava/lang/String;)V
    .registers 3

    .line 81
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x1

    invoke-static {v0, p0, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private finishBeforeLeaving()Z
    .registers 3

    .line 89
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dirty()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 p0, 0x1

    return p0

    .line 90
    :cond_8
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameEditor:Landroid/widget/EditText;

    const-string v1, "profile_finish_name"

    invoke-direct {p0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameEditor:Landroid/widget/EditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->requestFocus()Z

    const/4 p0, 0x0

    return p0
.end method

.method private flush()Z
    .registers 2

    .line 82
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->flushCurrent()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const-string v0, "profile_invalid_edits"

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->error(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method private init()V
    .registers 2

    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->setPersistent(Z)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->setSelectable(Z)V

    return-void
.end method

.method static synthetic lambda$action$1(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 78
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method private synthetic lambda$addProfile$16()V
    .registers 1

    .line 258
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->close()V

    return-void
.end method

.method private synthetic lambda$addProfile$17(Landroid/widget/EditText;)V
    .registers 5

    .line 260
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->defaultName()Ljava/lang/String;

    move-result-object v0

    .line 262
    :cond_16
    :try_start_16
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->flush()Z

    move-result v1

    if-nez v1, :cond_1d

    goto :goto_4a

    .line 263
    :cond_1d
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "https://api.deepseek.com"

    invoke-static {v1, v0, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->create(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 264
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->select(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_37

    const-string v0, "profile_invalid_edits"

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->error(Ljava/lang/String;)V

    return-void

    .line 265
    :cond_37
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->close()V
    :try_end_3a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_16 .. :try_end_3a} :catch_41
    .catch Ljava/lang/IllegalStateException; {:try_start_16 .. :try_end_3a} :catch_3b

    return-void

    .line 267
    :catch_3b
    const-string p1, "profile_add_failed"

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->error(Ljava/lang/String;)V

    goto :goto_4a

    .line 266
    :catch_41
    const-string v0, "profile_name_error"

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_4a
    return-void
.end method

.method private synthetic lambda$addRow$4(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Ljava/lang/String;Landroid/view/View;)V
    .registers 4

    .line 127
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->current(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Z

    move-result p1

    if-eqz p1, :cond_20

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->finishBeforeLeaving()Z

    move-result p1

    if-nez p1, :cond_d

    goto :goto_20

    .line 128
    :cond_d
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->select(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1b

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->close()V

    return-void

    :cond_1b
    const-string p1, "profile_invalid_edits"

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->error(Ljava/lang/String;)V

    :cond_20
    :goto_20
    return-void
.end method

.method private synthetic lambda$addRow$5(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/view/View;)V
    .registers 3

    .line 130
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->toggle(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    return-void
.end method

.method private synthetic lambda$addRow$6(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/view/View;)Z
    .registers 3

    .line 131
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->toggle(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    const/4 p0, 0x1

    return p0
.end method

.method private synthetic lambda$beginDelete$14(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V
    .registers 3

    .line 234
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->current(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->showActions(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    :cond_9
    return-void
.end method

.method private synthetic lambda$beginDelete$15(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Ljava/lang/String;)V
    .registers 5

    .line 236
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->current(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 237
    :cond_7
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_1a

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->showActions(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    return-void

    .line 239
    :cond_1a
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->deletionContext(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_28

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->beginDelete(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    return-void

    .line 240
    :cond_28
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object v0, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->id:Ljava/lang/String;

    invoke-static {p2, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->delete(Landroid/content/Context;Ljava/lang/String;)V

    const/4 p2, 0x0

    .line 241
    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->listBody:Landroid/widget/LinearLayout;

    iget-object v0, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->rows:Ljava/util/LinkedHashMap;

    iget-object p1, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->id:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->refreshNames()V

    return-void
.end method

.method private synthetic lambda$beginRename$10(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/widget/EditText;)V
    .registers 4

    .line 202
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->current(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameEditor:Landroid/widget/EditText;

    if-ne v0, p2, :cond_d

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->showActions(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    :cond_d
    return-void
.end method

.method private synthetic lambda$beginRename$11(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/widget/EditText;)V
    .registers 5

    .line 204
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->current(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameEditor:Landroid/widget/EditText;

    if-eq v0, p2, :cond_b

    goto :goto_38

    .line 205
    :cond_b
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 206
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_27

    const-string p1, "profile_name_error"

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    .line 207
    :cond_27
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object v1, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->id:Ljava/lang/String;

    invoke-static {p2, v1, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->rename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->collapse()V

    iget-object p0, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->more:Landroid/widget/ImageButton;

    invoke-virtual {p0}, Landroid/widget/ImageButton;->requestFocus()Z

    :cond_38
    :goto_38
    return-void
.end method

.method static synthetic lambda$beginRename$12(Ljava/lang/Runnable;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 4

    const/4 p1, 0x6

    if-ne p2, p1, :cond_8

    .line 212
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method private synthetic lambda$beginRename$13(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;Landroid/widget/EditText;)V
    .registers 3

    .line 216
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->current(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Z

    move-result p1

    if-eqz p1, :cond_20

    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameEditor:Landroid/widget/EditText;

    if-eq p1, p2, :cond_b

    goto :goto_20

    .line 217
    :cond_b
    invoke-virtual {p2}, Landroid/widget/EditText;->requestFocus()Z

    .line 218
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "input_method"

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    if-eqz p0, :cond_20

    const/4 p1, 0x1

    .line 219
    invoke-virtual {p0, p2, p1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    :cond_20
    :goto_20
    return-void
.end method

.method private synthetic lambda$clearCurrentKey$18(Ljava/lang/String;)V
    .registers 2

    .line 275
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->clearKey(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private synthetic lambda$reveal$7(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V
    .registers 5

    .line 181
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->current(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    if-ne p0, p1, :cond_22

    iget-object p0, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    new-instance v0, Landroid/graphics/Rect;

    iget-object v1, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v1

    iget-object p1, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getHeight()I

    move-result p1

    const/4 v2, 0x0

    invoke-direct {v0, v2, v2, v1, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 p1, 0x1

    invoke-virtual {p0, v0, p1}, Landroid/widget/LinearLayout;->requestRectangleOnScreen(Landroid/graphics/Rect;Z)Z

    :cond_22
    return-void
.end method

.method private synthetic lambda$show$0(Landroid/app/Dialog;Landroid/content/DialogInterface;)V
    .registers 3

    .line 59
    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dialog:Landroid/app/Dialog;

    if-ne p2, p1, :cond_18

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->endRename()V

    const/4 p1, 0x0

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dialog:Landroid/app/Dialog;

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->listDialog:Landroid/app/Dialog;

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->rows:Ljava/util/LinkedHashMap;

    invoke-virtual {p2}, Ljava/util/LinkedHashMap;->clear()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->listBody:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->notifyChanged()V

    :cond_18
    return-void
.end method

.method private synthetic lambda$showActions$8(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V
    .registers 2

    .line 187
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->beginRename(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    return-void
.end method

.method private synthetic lambda$showActions$9(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V
    .registers 2

    .line 189
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->beginDelete(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    return-void
.end method

.method private synthetic lambda$showProfiles$2()V
    .registers 2

    .line 102
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->finishBeforeLeaving()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->flush()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->addProfile()V

    :cond_f
    return-void
.end method

.method private synthetic lambda$showProfiles$3(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .registers 4

    const/4 p1, 0x4

    if-ne p2, p1, :cond_24

    .line 104
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    if-nez p1, :cond_8

    goto :goto_24

    .line 105
    :cond_8
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_23

    .line 106
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->finishBeforeLeaving()Z

    move-result p1

    if-nez p1, :cond_16

    return p2

    .line 107
    :cond_16
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->renameEditor:Landroid/widget/EditText;

    if-eqz p1, :cond_20

    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->showActions(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    goto :goto_23

    :cond_20
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->collapse()V

    :cond_23
    :goto_23
    return p2

    :cond_24
    :goto_24
    const/4 p0, 0x0

    return p0
.end method

.method private message(Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .registers 5

    .line 67
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->caption(Landroid/widget/TextView;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 p2, 0x8

    .line 68
    invoke-direct {p0, p2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dp(I)I

    move-result p2

    const/16 v1, 0xc

    invoke-direct {p0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dp(I)I

    move-result p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2, v1, p0}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, -0x1

    const/4 v1, -0x2

    invoke-direct {p0, p2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private refreshNames()V
    .registers 10

    .line 141
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 142
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->rows:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    .line 143
    iget-object v4, v3, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->id:Ljava/lang/String;

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-nez v4, :cond_31

    goto :goto_1a

    .line 144
    :cond_31
    iget-object v5, v3, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->id:Ljava/lang/String;

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 145
    iget-object v6, v3, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->name:Landroid/widget/TextView;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v5, :cond_43

    const-string v8, "\u2713  "

    goto :goto_45

    :cond_43
    const-string v8, "    "

    :goto_45
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v6, v3, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->name:Landroid/widget/TextView;

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setSelected(Z)V

    .line 146
    iget-object v6, v3, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->name:Landroid/widget/TextView;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v5, :cond_78

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v8, ", "

    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "profile_current"

    invoke-direct {p0, v8}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_7a

    :cond_78
    const-string v5, ""

    :goto_7a
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 147
    iget-object v5, v3, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->more:Landroid/widget/ImageButton;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v6

    iget-object v7, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    if-ne v3, v7, :cond_90

    const/4 v7, 0x4

    goto :goto_91

    :cond_90
    const/4 v7, 0x3

    :goto_91
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result v8

    invoke-static {v6, v7, v8}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->icon(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 148
    iget-object v5, v3, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->more:Landroid/widget/ImageButton;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    if-ne v3, v7, :cond_ae

    const-string v3, "profile_collapse"

    goto :goto_b0

    :cond_ae
    const-string v3, "profile_more"

    :goto_b0
    invoke-direct {p0, v3}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": "

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    goto/16 :goto_1a

    .line 150
    :cond_c8
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->notifyChanged()V

    return-void
.end method

.method private reveal(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V
    .registers 4

    .line 181
    iget-object v0, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda16;

    invoke-direct {v1, p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda16;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private show(Ljava/lang/String;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .registers 5

    const/4 v0, 0x0

    .line 52
    invoke-direct {p0, p1, p2, p3, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->show(Ljava/lang/String;Landroid/widget/LinearLayout;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method private show(Ljava/lang/String;Landroid/widget/LinearLayout;Ljava/lang/String;Landroid/view/View;)V
    .registers 6

    .line 55
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->close()V

    .line 56
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, p3}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-static {v0, p1, p2, p3, p4}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs;->show(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;Ljava/lang/String;Landroid/view/View;)Landroid/app/Dialog;

    move-result-object p1

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dialog:Landroid/app/Dialog;

    .line 58
    new-instance p2, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda3;

    invoke-direct {p2, p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda3;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Landroid/app/Dialog;)V

    invoke-virtual {p1, p2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    return-void
.end method

.method private showActions(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V
    .registers 5

    .line 184
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->current(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Z

    move-result v0

    if-eqz v0, :cond_45

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    if-eq v0, p1, :cond_b

    goto :goto_45

    .line 185
    :cond_b
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->endRename()V

    iget-object v0, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 186
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->strip(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;

    move-result-object v0

    .line 187
    const-string v1, "profile_rename"

    invoke-direct {p0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda12;

    invoke-direct {v2, p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda12;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    invoke-virtual {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->add(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 188
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_42

    .line 189
    const-string v1, "profile_delete"

    invoke-direct {p0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda13;

    invoke-direct {v2, p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda13;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    invoke-virtual {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->add(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 191
    :cond_42
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->reveal(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    :cond_45
    :goto_45
    return-void
.end method

.method private strip(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;
    .registers 5

    .line 177
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;-><init>(Landroid/content/Context;)V

    .line 178
    iget-object p0, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {p1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private styleAction(Landroid/widget/TextView;)V
    .registers 6

    .line 71
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->title(Landroid/widget/TextView;)V

    const/16 v0, 0xc

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dp(I)I

    move-result v1

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dp(I)I

    move-result v2

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dp(I)I

    move-result v3

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dp(I)I

    move-result v0

    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    const/16 v0, 0x30

    .line 72
    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dp(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMinHeight(I)V

    const v0, 0x800013

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v0, 0x1

    .line 73
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setFocusable(Z)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setClickable(Z)V

    .line 74
    new-instance v0, Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result p0

    const/16 v1, 0x18

    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->tint(II)I

    move-result p0

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, -0x1

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private text(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 38
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->settings(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private toggle(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V
    .registers 5

    .line 153
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->current(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)Z

    move-result v0

    if-eqz v0, :cond_50

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->finishBeforeLeaving()Z

    move-result v0

    if-nez v0, :cond_d

    goto :goto_50

    .line 154
    :cond_d
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    if-ne v0, p1, :cond_15

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->collapse()V

    return-void

    .line 155
    :cond_15
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->collapse()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->expanded:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;

    .line 156
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/16 v1, 0xa

    invoke-direct {p0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dp(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 157
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result v1

    const/4 v2, 0x5

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->tint(II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    iget-object v1, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->root:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setClipToOutline(Z)V

    .line 158
    iget-object v0, p1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->showActions(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;)V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->refreshNames()V

    :cond_50
    :goto_50
    return-void
.end method


# virtual methods
.method clearCurrentKey()V
    .registers 7

    .line 272
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->flushExceptKey()Z

    move-result v0

    if-nez v0, :cond_c

    const-string v0, "profile_invalid_edits"

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->error(Ljava/lang/String;)V

    return-void

    .line 273
    :cond_c
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 274
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "profile_clear_key_summary"

    invoke-direct {p0, v3}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "profile_clear_key"

    .line 275
    invoke-direct {p0, v4}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda17;

    invoke-direct {v5, p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda17;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Ljava/lang/String;)V

    .line 274
    invoke-static {v2, v1, v3, v4, v5}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs;->confirm(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/app/Dialog;

    return-void
.end method

.method protected onBindView(Landroid/view/View;)V
    .registers 4

    .line 43
    const-string v0, "profiles_title"

    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 44
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 45
    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    const p0, 0x1020010

    .line 46
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    if-eqz p0, :cond_39

    const/4 p1, 0x1

    .line 47
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object p1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    :cond_39
    return-void
.end method

.method protected onClick()V
    .registers 1

    .line 49
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->showProfiles()V

    return-void
.end method

.method protected onPrepareForRemoval()V
    .registers 1

    .line 277
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->close()V

    invoke-super {p0}, Landroid/preference/Preference;->onPrepareForRemoval()V

    return-void
.end method

.method showProfiles()V
    .registers 6

    .line 94
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->close()V

    .line 95
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->column()Landroid/widget/LinearLayout;

    move-result-object v0

    .line 97
    const-string v1, "profiles_title"

    invoke-direct {p0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "cancel"

    invoke-direct {p0, v1, v0, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->show(Ljava/lang/String;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 98
    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->listBody:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dialog:Landroid/app/Dialog;

    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->listDialog:Landroid/app/Dialog;

    .line 99
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->list(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_28
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_38

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {p0, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->addRow(Ljava/lang/String;)V

    goto :goto_28

    .line 100
    :cond_38
    new-instance v1, Landroid/view/View;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result v2

    const/16 v3, 0x18

    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->tint(II)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 101
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dp(I)I

    move-result v3

    const/4 v4, -0x1

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 102
    const-string v1, "profile_add"

    invoke-direct {p0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda8;

    invoke-direct {v2, p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda8;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;)V

    invoke-direct {p0, v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->action(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    .line 103
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->dialog:Landroid/app/Dialog;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda9;

    invoke-direct {v1, p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda9;-><init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 111
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->refreshNames()V

    return-void
.end method
