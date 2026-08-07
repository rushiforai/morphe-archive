.class Lcom/clevertap/android/sdk/inbox/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private a:Lorg/json/JSONObject;

.field private final b:Ljava/lang/String;

.field private final c:Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

.field private final d:Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

.field private final e:I

.field private f:Landroidx/viewpager/widget/ViewPager;

.field private final g:Z

.field private final h:I


# direct methods
.method public constructor <init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;Landroidx/viewpager/widget/ViewPager;ZI)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput p1, p0, Lcom/clevertap/android/sdk/inbox/e;->e:I

    .line 21
    iput-object p2, p0, Lcom/clevertap/android/sdk/inbox/e;->d:Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

    .line 22
    iput-object p3, p0, Lcom/clevertap/android/sdk/inbox/e;->b:Ljava/lang/String;

    .line 23
    iput-object p4, p0, Lcom/clevertap/android/sdk/inbox/e;->c:Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 24
    iput-object p5, p0, Lcom/clevertap/android/sdk/inbox/e;->f:Landroidx/viewpager/widget/ViewPager;

    .line 25
    iput-boolean p6, p0, Lcom/clevertap/android/sdk/inbox/e;->g:Z

    .line 26
    iput p7, p0, Lcom/clevertap/android/sdk/inbox/e;->h:I

    return-void
.end method

.method public constructor <init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/clevertap/android/sdk/inbox/e;->e:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/clevertap/android/sdk/inbox/e;->d:Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/clevertap/android/sdk/inbox/e;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p5, p0, Lcom/clevertap/android/sdk/inbox/e;->c:Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 11
    .line 12
    iput-object p4, p0, Lcom/clevertap/android/sdk/inbox/e;->a:Lorg/json/JSONObject;

    .line 13
    .line 14
    iput-boolean p6, p0, Lcom/clevertap/android/sdk/inbox/e;->g:Z

    .line 15
    .line 16
    iput p7, p0, Lcom/clevertap/android/sdk/inbox/e;->h:I

    .line 17
    .line 18
    return-void
.end method

.method private a(Landroid/content/Context;)V
    .locals 4

    .line 1
    const-string v0, "clipboard"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/content/ClipboardManager;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/e;->b:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/clevertap/android/sdk/inbox/e;->d:Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->d()Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/e;->a:Lorg/json/JSONObject;

    .line 25
    .line 26
    invoke-virtual {v2, p0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->g(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {v1, p0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 37
    .line 38
    .line 39
    const-string p0, "Text Copied to Clipboard"

    .line 40
    .line 41
    invoke-static {p1, p0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method private b(Lcom/clevertap/android/sdk/inbox/CTInboxMessage;)Ljava/util/HashMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/inbox/CTInboxMessage;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->d()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->d()Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->d()Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;

    .line 29
    .line 30
    iget-object v2, p0, Lcom/clevertap/android/sdk/inbox/e;->a:Lorg/json/JSONObject;

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->m(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v2, "kv"

    .line 37
    .line 38
    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->d()Ljava/util/ArrayList;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/e;->a:Lorg/json/JSONObject;

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->h(Lorg/json/JSONObject;)Ljava/util/HashMap;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_0
    const/4 p0, 0x0

    .line 62
    return-object p0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 14

    .line 1
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/e;->f:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/e;->c:Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget p0, p0, Lcom/clevertap/android/sdk/inbox/e;->e:I

    .line 10
    .line 11
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {v0, p0, p1}, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;->f4(II)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/e;->b:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/e;->a:Lorg/json/JSONObject;

    .line 24
    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/e;->c:Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 28
    .line 29
    if-eqz p1, :cond_3

    .line 30
    .line 31
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/e;->d:Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->d()Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;

    .line 43
    .line 44
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/e;->a:Lorg/json/JSONObject;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->m(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string v0, "copy"

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/e;->c:Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 59
    .line 60
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    if-eqz p1, :cond_1

    .line 65
    .line 66
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/e;->c:Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 67
    .line 68
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inbox/e;->a(Landroid/content/Context;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/e;->c:Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 76
    .line 77
    iget v1, p0, Lcom/clevertap/android/sdk/inbox/e;->e:I

    .line 78
    .line 79
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/e;->b:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v4, p0, Lcom/clevertap/android/sdk/inbox/e;->a:Lorg/json/JSONObject;

    .line 82
    .line 83
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/e;->d:Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

    .line 84
    .line 85
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inbox/e;->b(Lcom/clevertap/android/sdk/inbox/CTInboxMessage;)Ljava/util/HashMap;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    iget v6, p0, Lcom/clevertap/android/sdk/inbox/e;->h:I

    .line 90
    .line 91
    const/4 v2, 0x0

    .line 92
    invoke-virtual/range {v0 .. v6}, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;->e4(IILjava/lang/String;Lorg/json/JSONObject;Ljava/util/HashMap;I)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_2
    iget-object v7, p0, Lcom/clevertap/android/sdk/inbox/e;->c:Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 97
    .line 98
    if-eqz v7, :cond_3

    .line 99
    .line 100
    iget v8, p0, Lcom/clevertap/android/sdk/inbox/e;->e:I

    .line 101
    .line 102
    const/4 v12, 0x0

    .line 103
    iget v13, p0, Lcom/clevertap/android/sdk/inbox/e;->h:I

    .line 104
    .line 105
    const/4 v9, 0x0

    .line 106
    const/4 v10, 0x0

    .line 107
    const/4 v11, 0x0

    .line 108
    invoke-virtual/range {v7 .. v13}, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;->e4(IILjava/lang/String;Lorg/json/JSONObject;Ljava/util/HashMap;I)V

    .line 109
    .line 110
    .line 111
    :cond_3
    return-void
.end method
