.class public final synthetic Ll/l500;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/m500;

.field public final synthetic b:Ll/suf0;

.field public final synthetic c:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

.field public final synthetic d:Ll/hzc0;

.field public final synthetic e:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/m500;Ll/suf0;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ll/hzc0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l500;->a:Ll/m500;

    iput-object p2, p0, Ll/l500;->b:Ll/suf0;

    iput-object p3, p0, Ll/l500;->c:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    iput-object p4, p0, Ll/l500;->d:Ll/hzc0;

    iput-object p5, p0, Ll/l500;->e:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/l500;->a:Ll/m500;

    iget-object v1, p0, Ll/l500;->b:Ll/suf0;

    iget-object v2, p0, Ll/l500;->c:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    iget-object v3, p0, Ll/l500;->d:Ll/hzc0;

    iget-object v4, p0, Ll/l500;->e:Ljava/util/List;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;

    invoke-static/range {v0 .. v5}, Ll/m500;->a(Ll/m500;Ll/suf0;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ll/hzc0;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;)V

    return-void
.end method
