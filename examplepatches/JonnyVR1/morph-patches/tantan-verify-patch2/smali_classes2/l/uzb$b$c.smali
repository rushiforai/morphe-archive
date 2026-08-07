.class public Ll/uzb$b$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/uzb$b;->e8(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/os/Bundle;

.field public final synthetic b:Ll/uzb$b;


# direct methods
.method public constructor <init>(Ll/uzb$b;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uzb$b$c;->b:Ll/uzb$b;

    .line 2
    .line 3
    iput-object p2, p0, Ll/uzb$b$c;->a:Landroid/os/Bundle;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uzb$b$c;->b:Ll/uzb$b;

    .line 2
    .line 3
    iget-object v0, v0, Ll/uzb$b;->b:Ll/tzb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/uzb$b$c;->a:Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/tzb;->c(Landroid/os/Bundle;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
