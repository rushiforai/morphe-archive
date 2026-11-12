.class public final synthetic Ljln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:Ls14;

.field public final synthetic b:Llt2;

.field public final synthetic c:Landroid/content/ContentResolver;

.field public final synthetic d:Landroid/net/Uri;

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Ls14;Llt2;Landroid/content/ContentResolver;Landroid/net/Uri;I)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljln;->a:Ls14;

    iput-object p2, p0, Ljln;->b:Llt2;

    iput-object p3, p0, Ljln;->c:Landroid/content/ContentResolver;

    iput-object p4, p0, Ljln;->d:Landroid/net/Uri;

    iput p5, p0, Ljln;->e:I

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget p1, p0, Ljln;->e:I

    const/4 v0, 0x0

    iget-object v1, p0, Ljln;->a:Ls14;

    iget-object v2, p0, Ljln;->c:Landroid/content/ContentResolver;

    iget-object v3, p0, Ljln;->d:Landroid/net/Uri;

    invoke-virtual {v1, v2, v3, p1, v0}, Ls14;->H(Landroid/content/ContentResolver;Landroid/net/Uri;IZ)Lkln;

    move-result-object p1

    iget-object p0, p0, Ljln;->b:Llt2;

    invoke-virtual {p0, p1}, Llt2;->run(Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method
