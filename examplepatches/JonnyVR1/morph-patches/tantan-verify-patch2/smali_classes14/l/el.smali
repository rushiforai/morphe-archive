.class public final synthetic Ll/el;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/el;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/el;->b:Ll/y20;

    iput-object p3, p0, Ll/el;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/el;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/el;->b:Ll/y20;

    iget-object p0, p0, Ll/el;->c:Ll/y20;

    check-cast p1, Ljava/util/Date;

    invoke-static {v0, v1, p0, p1}, Ll/sm;->s(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;Ljava/util/Date;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
