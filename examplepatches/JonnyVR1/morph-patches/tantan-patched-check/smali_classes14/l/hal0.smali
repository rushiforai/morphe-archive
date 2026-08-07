.class public final synthetic Ll/hal0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ial0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/ial0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hal0;->a:Ll/ial0;

    iput-object p2, p0, Ll/hal0;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hal0;->a:Ll/ial0;

    iget-object p0, p0, Ll/hal0;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/ial0;->l(Ll/ial0;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V

    return-void
.end method
