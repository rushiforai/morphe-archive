.class public final synthetic Ll/eln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eln;->a:Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;

    iput-object p2, p0, Ll/eln;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eln;->a:Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;

    iget-object p0, p0, Ll/eln;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->c(Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
