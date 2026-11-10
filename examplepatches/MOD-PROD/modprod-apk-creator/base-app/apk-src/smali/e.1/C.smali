.class public final synthetic Le/C;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly/k;


# instance fields
.field public final synthetic a:Le/g;


# direct methods
.method public synthetic constructor <init>(Le/g;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/C;->a:Le/g;

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/KeyEvent;)Z
    .locals 1

    iget-object v0, p0, Le/C;->a:Le/g;

    invoke-virtual {v0, p1}, Le/g;->k(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method
