.class public final synthetic Ll/am;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VText;

.field public final synthetic b:Lv/VEditText;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/am;->a:Lv/VText;

    iput-object p2, p0, Ll/am;->b:Lv/VEditText;

    iput-object p3, p0, Ll/am;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/am;->a:Lv/VText;

    iget-object v1, p0, Ll/am;->b:Lv/VEditText;

    iget-object p0, p0, Ll/am;->c:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Ll/sm;->I(Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V

    return-void
.end method
