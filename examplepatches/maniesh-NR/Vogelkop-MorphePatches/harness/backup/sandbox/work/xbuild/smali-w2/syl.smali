.class public final Lsyl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljnf;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsyl;->a:Lcom/opera/android/BrowserActivity;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    const-class v0, Lwyl;

    invoke-static {v0}, Lzhj;->b(Ljava/lang/Class;)Lzhj;

    move-result-object v0

    iget-object p0, p0, Lsyl;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method
