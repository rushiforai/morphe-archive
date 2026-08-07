.class public final synthetic Ll/v4k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/q5k0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/q5k0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v4k0;->a:Ll/q5k0;

    iput-object p2, p0, Ll/v4k0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/v4k0;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/v4k0;->d:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/v4k0;->a:Ll/q5k0;

    iget-object v1, p0, Ll/v4k0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/v4k0;->c:Ljava/lang/String;

    iget-boolean p0, p0, Ll/v4k0;->d:Z

    invoke-static {v0, v1, v2, p0}, Ll/q5k0;->w(Ll/q5k0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    return-void
.end method
