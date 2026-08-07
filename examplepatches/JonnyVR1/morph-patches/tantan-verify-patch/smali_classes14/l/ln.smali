.class public final synthetic Ll/ln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VEditText;

.field public final synthetic b:Lv/VText;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lv/VEditText;


# direct methods
.method public synthetic constructor <init>(Lv/VEditText;Lv/VText;Lcom/p1/mobile/android/app/Act;Lv/VEditText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ln;->a:Lv/VEditText;

    iput-object p2, p0, Ll/ln;->b:Lv/VText;

    iput-object p3, p0, Ll/ln;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/ln;->d:Lv/VEditText;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ln;->a:Lv/VEditText;

    iget-object v1, p0, Ll/ln;->b:Lv/VText;

    iget-object v2, p0, Ll/ln;->c:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/ln;->d:Lv/VEditText;

    check-cast p1, Lcom/p1/mobile/account_core/reponse_data/RiskVerification;

    invoke-static {v0, v1, v2, p0, p1}, Ll/zn;->D(Lv/VEditText;Lv/VText;Lcom/p1/mobile/android/app/Act;Lv/VEditText;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V

    return-void
.end method
