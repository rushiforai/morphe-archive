.class public final Lqne;
.super Lkch;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqne;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a(Lio7;ILnch;Ljch;)V
    .registers 6

    :try_start_0
    invoke-virtual {p3}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result p1

    and-int/lit8 p1, p1, 0x1

    if-eqz p1, :cond_2d

    invoke-virtual {p3}, Lizd;->h()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/net/URI;

    invoke-direct {p2, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    new-instance p3, Lg77;

    const/4 v0, 0x0

    invoke-direct {p3, p2, p1, v0}, Lg77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p1, Lpp6;

    iget-object p0, p0, Lqne;->a:Landroid/content/Context;

    invoke-direct {p1, p0}, Lpp6;-><init>(Landroid/content/Context;)V

    new-instance p0, Lcom/opera/android/browser/obml/MiniHttpClient$Call;

    sget-object p2, Lhzd;->b:Lhzd;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, p2, p3, p1}, Lcom/opera/android/browser/obml/MiniHttpClient$Call;-><init>(Lhzd;Lg77;Lpp6;)V
    :try_end_2d
    .catchall {:try_start_0 .. :try_end_2d} :catchall_2d

    :catchall_2d
    :cond_2d
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p4, p0}, Ljch;->run(Ljava/lang/Object;)V

    return-void
.end method
