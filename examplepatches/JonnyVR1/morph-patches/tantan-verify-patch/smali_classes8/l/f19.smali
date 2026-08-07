.class public final synthetic Ll/f19;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f19;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/f19;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f19;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/f19;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/x19;->p(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V

    return-void
.end method
