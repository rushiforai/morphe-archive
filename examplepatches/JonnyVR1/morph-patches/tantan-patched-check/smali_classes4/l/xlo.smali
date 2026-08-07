.class public final synthetic Ll/xlo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorsItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;

.field public final synthetic c:Z

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorsItemView;Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xlo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorsItemView;

    iput-object p2, p0, Ll/xlo;->b:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;

    iput-boolean p3, p0, Ll/xlo;->c:Z

    iput-boolean p4, p0, Ll/xlo;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xlo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorsItemView;

    iget-object v1, p0, Ll/xlo;->b:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;

    iget-boolean v2, p0, Ll/xlo;->c:Z

    iget-boolean p0, p0, Ll/xlo;->d:Z

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorsItemView;->a(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorsItemView;Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;ZZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method
