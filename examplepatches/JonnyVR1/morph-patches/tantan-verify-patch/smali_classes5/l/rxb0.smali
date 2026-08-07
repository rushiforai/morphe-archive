.class public final synthetic Ll/rxb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lkotlin/jvm/functions/Function1;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Z

.field public final synthetic d:Ll/wyb0;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/android/app/Act;ZLl/wyb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rxb0;->a:Lkotlin/jvm/functions/Function1;

    iput-object p2, p0, Ll/rxb0;->b:Lcom/p1/mobile/android/app/Act;

    iput-boolean p3, p0, Ll/rxb0;->c:Z

    iput-object p4, p0, Ll/rxb0;->d:Ll/wyb0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rxb0;->a:Lkotlin/jvm/functions/Function1;

    iget-object v1, p0, Ll/rxb0;->b:Lcom/p1/mobile/android/app/Act;

    iget-boolean v2, p0, Ll/rxb0;->c:Z

    iget-object p0, p0, Ll/rxb0;->d:Ll/wyb0;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {v0, v1, v2, p0, p1}, Ll/wyb0;->u(Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/android/app/Act;ZLl/wyb0;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
