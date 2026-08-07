.class public Ll/uzb$b$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/uzb$b;->X7(Ljava/lang/String;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Landroid/os/Bundle;

.field public final synthetic c:Ll/uzb$b;


# direct methods
.method public constructor <init>(Ll/uzb$b;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uzb$b$d;->c:Ll/uzb$b;

    .line 2
    .line 3
    iput-object p2, p0, Ll/uzb$b$d;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/uzb$b$d;->b:Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uzb$b$d;->c:Ll/uzb$b;

    .line 2
    .line 3
    iget-object v0, v0, Ll/uzb$b;->b:Ll/tzb;

    .line 4
    .line 5
    iget-object v1, p0, Ll/uzb$b$d;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Ll/uzb$b$d;->b:Landroid/os/Bundle;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0}, Ll/tzb;->e(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
