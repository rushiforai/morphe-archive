.class public final Liu5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj8f;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Liu5;->a:Ljava/lang/String;

    iput-object p2, p0, Liu5;->b:Ljava/lang/String;

    iput-object p3, p0, Liu5;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Liu5;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final b()Landroid/net/Uri;
    .registers 1

    const-string p0, "https://picsum.photos/200/300"

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public final c()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Liu5;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final d()Ljava/lang/Double;
    .registers 3

    const-wide/high16 v0, 0x4021000000000000L    # 8.5

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    return-object p0
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Liu5;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final getUrl()Landroid/net/Uri;
    .registers 1

    const-string p0, "https://booking.com"

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method
