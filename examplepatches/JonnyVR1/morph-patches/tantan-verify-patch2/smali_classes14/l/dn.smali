.class public final synthetic Ll/dn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Lv/VButton;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Lv/VButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dn;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/dn;->b:Ll/x20;

    iput-object p3, p0, Ll/dn;->c:Lv/VButton;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dn;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/dn;->b:Ll/x20;

    iget-object p0, p0, Ll/dn;->c:Lv/VButton;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Ll/zn;->r(Lcom/p1/mobile/android/app/Act;Ll/x20;Lv/VButton;Ljava/lang/Throwable;)V

    return-void
.end method
