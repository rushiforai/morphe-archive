.class public final synthetic Ll/myb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/wyb0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/wyb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/myb0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/myb0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/myb0;->c:Ll/wyb0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/myb0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/myb0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/myb0;->c:Ll/wyb0;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Ll/wyb0;->k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/wyb0;Ll/uxj0;)V

    return-void
.end method
