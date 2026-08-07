.class public final synthetic Ll/etr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/eur;

.field public final synthetic b:Ll/gur;


# direct methods
.method public synthetic constructor <init>(Ll/eur;Ll/gur;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/etr;->a:Ll/eur;

    iput-object p2, p0, Ll/etr;->b:Ll/gur;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/etr;->a:Ll/eur;

    iget-object p0, p0, Ll/etr;->b:Ll/gur;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesInfiltrationItemPicView;->b(Ll/eur;Ll/gur;Landroid/view/View;)V

    return-void
.end method
