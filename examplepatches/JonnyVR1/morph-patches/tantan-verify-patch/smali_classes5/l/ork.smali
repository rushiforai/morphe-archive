.class public final synthetic Ll/ork;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ork;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/ork;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ork;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/ork;->b:Ljava/util/ArrayList;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/qtk;->J(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ll/uxj0;)V

    return-void
.end method
