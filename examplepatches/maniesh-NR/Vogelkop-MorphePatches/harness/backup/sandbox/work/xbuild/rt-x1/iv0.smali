.class public final synthetic Liv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;B)V
    .registers 3

    iput-byte p2, p0, Liv0;->a:B

    iput-object p1, p0, Liv0;->b:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Liv0;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Liv0;->b:Landroid/content/Context;

    packed-switch v0, :pswitch_data_98

    check-cast p1, Landroid/content/res/Configuration;

    new-instance v0, Lkl5;

    invoke-static {p0}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object p0

    invoke-direct {v0, p1, p0}, Lkl5;-><init>(Landroid/content/res/Configuration;Landroid/graphics/Rect;)V

    return-object v0

    :pswitch_14
    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of v0, p1, Lq0i;

    if-nez v0, :cond_1d

    move-object v1, p1

    :cond_1d
    check-cast v1, Ll22;

    if-eqz v1, :cond_30

    new-instance p1, Lc5o;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Lc5o;-><init>(Landroid/content/Context;B)V

    iget-object p0, v1, Ll22;->a:Ljava/util/ArrayList;

    iget-object v0, v1, Ll22;->b:Lo52;

    iget-object v1, v1, Ll22;->c:Ljava/lang/String;

    invoke-virtual {p1, p0, v0, v1}, Lc5o;->E(Ljava/util/List;Lo52;Ljava/lang/String;)V

    :cond_30
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_33
    check-cast p1, Landroid/net/Uri;

    invoke-static {p1}, Ls29;->g(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_4d

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, LJ/N;->MWbg1PSR(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_61

    move-object v1, p0

    goto :goto_61

    :cond_4d
    const-string v0, "content"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_61

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    :cond_61
    :goto_61
    new-instance p0, Lly1;

    invoke-direct {p0, p1, v1}, Lly1;-><init>(Landroid/net/Uri;Ljava/lang/String;)V

    return-object p0

    :pswitch_67
    check-cast p1, Ljava/lang/Integer;

    sget v0, Lcom/opera/android/aiassistant/appwidget/AiAssistantAppWidget;->b:I

    if-eqz p1, :cond_8a

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyk6;

    iget-object p0, p0, Lyk6;->h:Lwjh;

    invoke-virtual {p0, p1}, Lwjh;->u(I)V

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_8a
    return-object v1

    :pswitch_8b
    check-cast p1, Lkotlin/Unit;

    sget p1, Lcom/opera/android/aiassistant/appwidget/AiAssistantAppWidget;->b:I

    sget p1, Leif;->a:I

    const-class p1, Lcom/opera/android/aiassistant/appwidget/AiAssistantAppWidget;

    invoke-static {p0, p1}, Lkfo;->I(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_data_98
    .packed-switch 0x0
        :pswitch_8b
        :pswitch_67
        :pswitch_33
        :pswitch_14
    .end packed-switch
.end method
