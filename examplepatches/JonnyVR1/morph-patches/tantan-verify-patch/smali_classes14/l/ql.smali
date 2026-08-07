.class public final synthetic Ll/ql;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lv/VEditText;

.field public final synthetic b:Lv/VText;

.field public final synthetic c:Lv/VText;

.field public final synthetic d:Lv/VEditText;

.field public final synthetic e:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lv/VEditText;Lv/VText;Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ql;->a:Lv/VEditText;

    iput-object p2, p0, Ll/ql;->b:Lv/VText;

    iput-object p3, p0, Ll/ql;->c:Lv/VText;

    iput-object p4, p0, Ll/ql;->d:Lv/VEditText;

    iput-object p5, p0, Ll/ql;->e:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ql;->a:Lv/VEditText;

    iget-object v1, p0, Ll/ql;->b:Lv/VText;

    iget-object v2, p0, Ll/ql;->c:Lv/VText;

    iget-object v3, p0, Ll/ql;->d:Lv/VEditText;

    iget-object v4, p0, Ll/ql;->e:Lcom/p1/mobile/android/app/Act;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/sm;->P(Lv/VEditText;Lv/VText;Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
