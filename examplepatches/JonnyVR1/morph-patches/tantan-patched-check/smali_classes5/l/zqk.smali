.class public final synthetic Ll/zqk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VEditText;

.field public final synthetic b:Lv/VText;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lv/VText;

.field public final synthetic e:Lv/VButton;


# direct methods
.method public synthetic constructor <init>(Lv/VEditText;Lv/VText;Lcom/p1/mobile/android/app/Act;Lv/VText;Lv/VButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zqk;->a:Lv/VEditText;

    iput-object p2, p0, Ll/zqk;->b:Lv/VText;

    iput-object p3, p0, Ll/zqk;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/zqk;->d:Lv/VText;

    iput-object p5, p0, Ll/zqk;->e:Lv/VButton;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/zqk;->a:Lv/VEditText;

    iget-object v1, p0, Ll/zqk;->b:Lv/VText;

    iget-object v2, p0, Ll/zqk;->c:Lcom/p1/mobile/android/app/Act;

    iget-object v3, p0, Ll/zqk;->d:Lv/VText;

    iget-object v4, p0, Ll/zqk;->e:Lv/VButton;

    move-object v5, p1

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static/range {v0 .. v5}, Ll/qtk;->d0(Lv/VEditText;Lv/VText;Lcom/p1/mobile/android/app/Act;Lv/VText;Lv/VButton;Ljava/lang/CharSequence;)V

    return-void
.end method
