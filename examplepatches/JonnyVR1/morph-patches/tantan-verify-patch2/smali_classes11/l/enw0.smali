.class public final synthetic Ll/enw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# instance fields
.field public final synthetic a:Ll/snw0;


# direct methods
.method public synthetic constructor <init>(Ll/snw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/enw0;->a:Ll/snw0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final binderDied()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/enw0;->a:Ll/snw0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/snw0;->j(Ll/snw0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
