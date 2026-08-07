.class public final synthetic Ll/hu90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hu90;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/hu90;->b:Ll/x20;

    iput-object p3, p0, Ll/hu90;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hu90;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/hu90;->b:Ll/x20;

    iget-object p0, p0, Ll/hu90;->c:Ll/x20;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Ll/ou90;->d(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;Ll/uxj0;)V

    return-void
.end method
