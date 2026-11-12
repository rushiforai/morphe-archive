.class public final Lyy3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/android/browser/NavigationEntry;


# instance fields
.field public final synthetic a:Lzy3;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/BrowserTabState;Lzy3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lyy3;->a:Lzy3;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-object p0, p0, Lyy3;->a:Lzy3;

    iget-boolean p0, p0, Lzy3;->e:Z

    return p0
.end method

.method public final b()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final c()[B
    .registers 1

    iget-object p0, p0, Lyy3;->a:Lzy3;

    iget-object p0, p0, Lzy3;->f:[B

    return-object p0
.end method

.method public final d()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lyy3;->a:Lzy3;

    iget-object p0, p0, Lzy3;->d:Ljava/lang/String;

    return-object p0
.end method

.method public final e()[B
    .registers 1

    iget-object p0, p0, Lyy3;->a:Lzy3;

    iget-object p0, p0, Lzy3;->g:[B

    return-object p0
.end method

.method public final getId()I
    .registers 1

    iget-object p0, p0, Lyy3;->a:Lzy3;

    iget p0, p0, Lzy3;->a:I

    return p0
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lyy3;->a:Lzy3;

    iget-object p0, p0, Lzy3;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lyy3;->a:Lzy3;

    iget-object p0, p0, Lzy3;->b:Ljava/lang/String;

    return-object p0
.end method
