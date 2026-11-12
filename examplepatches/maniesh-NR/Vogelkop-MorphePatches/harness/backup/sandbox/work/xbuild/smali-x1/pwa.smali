.class public final synthetic Lpwa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/hype/image/editor/ImageEditorActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/hype/image/editor/ImageEditorActivity;B)V
    .registers 3

    iput-byte p2, p0, Lpwa;->a:B

    iput-object p1, p0, Lpwa;->b:Lcom/opera/hype/image/editor/ImageEditorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lpwa;->a:B

    const/4 v1, 0x0

    const-class v2, Landroid/net/Uri;

    iget-object p0, p0, Lpwa;->b:Lcom/opera/hype/image/editor/ImageEditorActivity;

    packed-switch v0, :pswitch_data_80

    sget-object v0, Lcom/opera/hype/image/editor/ImageEditorActivity;->d:Landroid/graphics/Bitmap$CompressFormat;

    new-instance v0, Lra5;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0}, Lra5;-><init>(Landroid/content/Context;)V

    return-object v0

    :pswitch_16
    sget-object v0, Lcom/opera/hype/image/editor/ImageEditorActivity;->d:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {p0}, Lcom/opera/hype/image/editor/ImageEditorActivity;->s()Lluf;

    move-result-object p0

    return-object p0

    :pswitch_1d
    sget-object v0, Lcom/opera/hype/image/editor/ImageEditorActivity;->d:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    if-eqz p0, :cond_30

    const-string v0, "output"

    invoke-static {p0, v0, v2}, Lyi4;->x(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Parcelable;

    move-object v1, p0

    check-cast v1, Landroid/net/Uri;

    :cond_30
    return-object v1

    :pswitch_31
    sget-object v0, Lcom/opera/hype/image/editor/ImageEditorActivity;->d:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    if-eqz p0, :cond_45

    const-string v0, "input-uri"

    invoke-static {p0, v0, v2}, Lyi4;->x(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Parcelable;

    check-cast p0, Landroid/net/Uri;

    if-nez p0, :cond_47

    :cond_45
    sget-object p0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    :cond_47
    return-object p0

    :pswitch_48
    sget-object v0, Lcom/opera/hype/image/editor/ImageEditorActivity;->d:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    if-eqz p0, :cond_5f

    const-string v0, "tools"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p0

    if-eqz p0, :cond_5f

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5f

    move-object v1, p0

    :cond_5f
    if-nez v1, :cond_7f

    sget-object p0, Lnsl;->d:Lavj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lnsl;->values()[Lnsl;

    move-result-object p0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    array-length v0, p0

    const/4 v2, 0x0

    :goto_71
    if-ge v2, v0, :cond_7f

    aget-object v3, p0, v2

    iget-boolean v4, v3, Lnsl;->c:Z

    if-eqz v4, :cond_7c

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7c
    add-int/lit8 v2, v2, 0x1

    goto :goto_71

    :cond_7f
    return-object v1

    :pswitch_data_80
    .packed-switch 0x0
        :pswitch_48
        :pswitch_31
        :pswitch_1d
        :pswitch_16
    .end packed-switch
.end method
