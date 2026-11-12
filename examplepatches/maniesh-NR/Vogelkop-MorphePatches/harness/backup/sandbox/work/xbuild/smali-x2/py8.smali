.class public final Lpy8;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:I

.field public final c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;ILandroid/content/Context;B)V
    .registers 5

    .line 295
    iput-byte p4, p0, Lpy8;->a:B

    iput-object p1, p0, Lpy8;->d:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput p2, p0, Lpy8;->b:I

    iput-object p3, p0, Lpy8;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Luy8;I)V
    .registers 10

    const/4 v0, 0x0

    iput-byte v0, p0, Lpy8;->a:B

    iput-object p1, p0, Lpy8;->d:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput p2, p0, Lpy8;->b:I

    new-instance p2, Lorb;

    invoke-direct {p2}, Lorb;-><init>()V

    iput-object p2, p0, Lpy8;->c:Ljava/lang/Object;

    const-string v1, "version"

    const/4 v2, 0x7

    invoke-virtual {p2, v2, v1}, Lorb;->n(ILjava/lang/String;)V

    iget-object v1, p1, Luy8;->d:Ljec;

    invoke-static {v1}, Lpy8;->b(Ljec;)Lvpb;

    move-result-object v1

    const-string v2, "events"

    invoke-virtual {p2, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p1, Luy8;->e:Ljec;

    invoke-static {v1}, Lpy8;->b(Ljec;)Lvpb;

    move-result-object v1

    const-string v2, "video_events"

    invoke-virtual {p2, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p1, Luy8;->f:Ljec;

    invoke-static {v1}, Lpy8;->b(Ljec;)Lvpb;

    move-result-object v1

    const-string v2, "clip_events"

    invoke-virtual {p2, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p1, Luy8;->q:Ljava/util/Set;

    invoke-static {v1}, Lpy8;->a(Ljava/util/Set;)Lvpb;

    move-result-object v1

    const-string v2, "report_click"

    invoke-virtual {p2, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p1, Luy8;->x:Ljava/util/Set;

    invoke-static {v1}, Lpy8;->a(Ljava/util/Set;)Lvpb;

    move-result-object v1

    const-string v2, "report_imp"

    invoke-virtual {p2, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p1, Luy8;->y:Ljava/util/Set;

    invoke-static {v1}, Lpy8;->a(Ljava/util/Set;)Lvpb;

    move-result-object v1

    const-string v2, "ack_imp"

    invoke-virtual {p2, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p1, Luy8;->s:Ljava/util/Set;

    invoke-static {v1}, Lpy8;->a(Ljava/util/Set;)Lvpb;

    move-result-object v1

    const-string v2, "report_stay"

    invoke-virtual {p2, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p1, Luy8;->r:Ljava/util/Set;

    invoke-static {v1}, Lpy8;->a(Ljava/util/Set;)Lvpb;

    move-result-object v1

    const-string v2, "report_share"

    invoke-virtual {p2, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lorb;

    iget-object v2, p1, Luy8;->m:Ljava/util/Map;

    invoke-direct {v1}, Lorb;-><init>()V

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_7e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_9a

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_7e

    :cond_9a
    const-string p0, "key == null"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    :cond_a1
    const-string v2, "experiments"

    invoke-virtual {p2, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p2, p0, Lpy8;->c:Ljava/lang/Object;

    check-cast p2, Lorb;

    iget-object v1, p1, Luy8;->z:Ljava/util/Set;

    invoke-static {v1}, Lpy8;->a(Ljava/util/Set;)Lvpb;

    move-result-object v1

    const-string v2, "report_dislike"

    invoke-virtual {p2, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p2, p0, Lpy8;->c:Ljava/lang/Object;

    check-cast p2, Lorb;

    iget-object v1, p1, Luy8;->A:Ljava/util/Set;

    invoke-static {v1}, Lpy8;->a(Ljava/util/Set;)Lvpb;

    move-result-object v1

    const-string v2, "report_feedback"

    invoke-virtual {p2, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lpy8;->c:Ljava/lang/Object;

    check-cast p0, Lorb;

    iget-object p1, p1, Luy8;->H:Lk5o;

    new-instance p2, Lorb;

    invoke-direct {p2}, Lorb;-><init>()V

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    iget-object p1, p1, Lk5o;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_e0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_11c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lh92;

    iget-object v4, v3, Lh92;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    if-eqz v4, :cond_e0

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    const-string v5, "type"

    iget-object v6, v3, Lh92;->a:Ljava/lang/String;

    invoke-virtual {v4, v6, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "request_id"

    iget-object v3, v3, Lh92;->b:Ljava/lang/String;

    invoke-virtual {v4, v3, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v4, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    const/16 v2, 0x190

    if-lt v0, v2, :cond_e0

    :cond_11c
    const-string p1, "articles"

    invoke-virtual {p2, v1, p1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "request_data"

    invoke-virtual {p0, p2, p1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public static a(Ljava/util/Set;)Lvpb;
    .registers 5

    new-instance v0, Lvpb;

    invoke-direct {v0}, Lvpb;-><init>()V

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v1

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    add-int/lit8 v1, v1, -0x1

    :try_start_1b
    iget-object v3, v0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-static {v2}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;
    :try_end_24
    .catch Lorg/json/JSONException; {:try_start_1b .. :try_end_24} :catch_25

    goto :goto_d

    :catch_25
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2b
    return-object v0
.end method

.method public static b(Ljec;)Lvpb;
    .registers 4

    new-instance v0, Lvpb;

    invoke-direct {v0}, Lvpb;-><init>()V

    invoke-virtual {p0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldy8;

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    invoke-virtual {v1, v2}, Ldy8;->a(Lorb;)V

    invoke-virtual {v0, v2}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_9

    :cond_21
    return-object v0
.end method


# virtual methods
.method public final doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lpy8;->a:B

    iget v1, p0, Lpy8;->b:I

    const/4 v2, 0x0

    iget-object v3, p0, Lpy8;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_82

    check-cast p1, [Ljava/lang/Void;

    sget-object p0, Landroidx/mediarouter/app/OperaMediaRouteButton;->q:Landroid/util/SparseArray;

    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/drawable/Drawable$ConstantState;

    if-nez p0, :cond_1c

    check-cast v3, Landroid/content/Context;

    invoke-static {v1, v3}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    :cond_1c
    return-object v2

    :pswitch_1d
    check-cast p1, [Ljava/lang/Void;

    sget-object p0, Landroidx/mediarouter/app/MediaRouteButton;->p:Landroid/util/SparseArray;

    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/drawable/Drawable$ConstantState;

    if-nez p0, :cond_2f

    check-cast v3, Landroid/content/Context;

    invoke-static {v1, v3}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    :cond_2f
    return-object v2

    :pswitch_30
    check-cast p1, [Ljava/lang/Void;

    new-instance p1, Ljava/io/File;

    iget-object p0, p0, Lpy8;->d:Ljava/lang/Object;

    check-cast p0, Luy8;

    iget-object v0, p0, Luy8;->J:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "newsfeedback~"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v0, Ljava/io/File;

    iget-object p0, p0, Luy8;->J:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "newsfeedback"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_50
    check-cast v3, Lorb;

    iget-object p0, v3, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "UTF-8"

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    sget-object v3, Ls29;->a:Ljava/util/HashSet;
    :try_end_60
    .catch Ljava/lang/OutOfMemoryError; {:try_start_50 .. :try_end_60} :catch_79

    :try_start_60
    invoke-virtual {p0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-static {p1, p0}, Ls29;->j(Ljava/io/File;[B)V
    :try_end_6b
    .catch Ljava/io/IOException; {:try_start_60 .. :try_end_6b} :catch_75
    .catch Ljava/lang/OutOfMemoryError; {:try_start_60 .. :try_end_6b} :catch_79

    :try_start_6b
    invoke-virtual {p1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p0

    if-nez p0, :cond_80

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    goto :goto_80

    :catch_75
    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_78
    .catch Ljava/lang/OutOfMemoryError; {:try_start_6b .. :try_end_78} :catch_79

    goto :goto_80

    :catch_79
    move-exception p0

    invoke-static {p0}, Lks3;->D(Ljava/lang/Throwable;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    :cond_80
    :goto_80
    return-object v2

    nop

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_30
        :pswitch_1d
    .end packed-switch
.end method

.method public final onCancelled(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Lpy8;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lpy8;->d:Ljava/lang/Object;

    iget v3, p0, Lpy8;->b:I

    packed-switch v0, :pswitch_data_32

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onCancelled(Ljava/lang/Object;)V

    return-void

    :pswitch_e
    check-cast p1, Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_1b

    sget-object p0, Landroidx/mediarouter/app/OperaMediaRouteButton;->q:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object p1

    invoke-virtual {p0, v3, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_1b
    check-cast v2, Landroidx/mediarouter/app/OperaMediaRouteButton;

    iput-object v1, v2, Landroidx/mediarouter/app/OperaMediaRouteButton;->h:Lpy8;

    return-void

    :pswitch_20
    check-cast p1, Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_2d

    sget-object p0, Landroidx/mediarouter/app/MediaRouteButton;->p:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object p1

    invoke-virtual {p0, v3, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_2d
    check-cast v2, Landroidx/mediarouter/app/MediaRouteButton;

    iput-object v1, v2, Landroidx/mediarouter/app/MediaRouteButton;->g:Lpy8;

    return-void

    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_20
        :pswitch_e
    .end packed-switch
.end method

.method public final onPostExecute(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Lpy8;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lpy8;->d:Ljava/lang/Object;

    iget p0, p0, Lpy8;->b:I

    packed-switch v0, :pswitch_data_6a

    check-cast p1, Landroid/graphics/drawable/Drawable;

    check-cast v2, Landroidx/mediarouter/app/OperaMediaRouteButton;

    if-eqz p1, :cond_1c

    sget-object v0, Landroidx/mediarouter/app/OperaMediaRouteButton;->q:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v3

    invoke-virtual {v0, p0, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iput-object v1, v2, Landroidx/mediarouter/app/OperaMediaRouteButton;->h:Lpy8;

    goto :goto_2c

    :cond_1c
    sget-object v0, Landroidx/mediarouter/app/OperaMediaRouteButton;->q:Landroid/util/SparseArray;

    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/drawable/Drawable$ConstantState;

    if-eqz p0, :cond_2a

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    :cond_2a
    iput-object v1, v2, Landroidx/mediarouter/app/OperaMediaRouteButton;->h:Lpy8;

    :goto_2c
    invoke-virtual {v2, p1}, Landroidx/mediarouter/app/OperaMediaRouteButton;->d(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_30
    check-cast p1, Landroid/graphics/drawable/Drawable;

    check-cast v2, Landroidx/mediarouter/app/MediaRouteButton;

    if-eqz p1, :cond_42

    sget-object v0, Landroidx/mediarouter/app/MediaRouteButton;->p:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v3

    invoke-virtual {v0, p0, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iput-object v1, v2, Landroidx/mediarouter/app/MediaRouteButton;->g:Lpy8;

    goto :goto_52

    :cond_42
    sget-object v0, Landroidx/mediarouter/app/MediaRouteButton;->p:Landroid/util/SparseArray;

    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/drawable/Drawable$ConstantState;

    if-eqz p0, :cond_50

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    :cond_50
    iput-object v1, v2, Landroidx/mediarouter/app/MediaRouteButton;->g:Lpy8;

    :goto_52
    invoke-virtual {v2, p1}, Landroidx/mediarouter/app/MediaRouteButton;->c(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_56
    check-cast p1, Ljava/lang/Void;

    check-cast v2, Luy8;

    iget p1, v2, Luy8;->l:I

    const/4 v0, 0x0

    if-le p1, p0, :cond_61

    const/4 p0, 0x1

    goto :goto_62

    :cond_61
    move p0, v0

    :goto_62
    iput v0, v2, Luy8;->l:I

    if-eqz p0, :cond_69

    invoke-virtual {v2}, Luy8;->n()V

    :cond_69
    return-void

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_56
        :pswitch_30
    .end packed-switch
.end method
