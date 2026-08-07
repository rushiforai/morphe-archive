.class public final synthetic Ll/n2h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n2h;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/n2h;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/n2h;->c:Z

    iput-object p4, p0, Ll/n2h;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n2h;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/n2h;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/n2h;->c:Z

    iget-object p0, p0, Ll/n2h;->d:Ll/y20;

    invoke-static {v0, v1, v2, p0}, Ll/k3h;->h0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLl/y20;)V

    return-void
.end method
