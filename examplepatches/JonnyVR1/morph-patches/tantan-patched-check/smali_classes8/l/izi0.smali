.class public final synthetic Ll/izi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/TickerView;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Ll/x20;

.field public final synthetic d:J

.field public final synthetic e:F

.field public final synthetic f:I

.field public final synthetic g:I

.field public final synthetic h:I

.field public final synthetic i:F

.field public final synthetic j:F


# direct methods
.method public synthetic constructor <init>(Lv/TickerView;Ll/x20;Ll/x20;JFIIIFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/izi0;->a:Lv/TickerView;

    iput-object p2, p0, Ll/izi0;->b:Ll/x20;

    iput-object p3, p0, Ll/izi0;->c:Ll/x20;

    iput-wide p4, p0, Ll/izi0;->d:J

    iput p6, p0, Ll/izi0;->e:F

    iput p7, p0, Ll/izi0;->f:I

    iput p8, p0, Ll/izi0;->g:I

    iput p9, p0, Ll/izi0;->h:I

    iput p10, p0, Ll/izi0;->i:F

    iput p11, p0, Ll/izi0;->j:F

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/izi0;->a:Lv/TickerView;

    iget-object v1, p0, Ll/izi0;->b:Ll/x20;

    iget-object v2, p0, Ll/izi0;->c:Ll/x20;

    iget-wide v3, p0, Ll/izi0;->d:J

    iget v5, p0, Ll/izi0;->e:F

    iget v6, p0, Ll/izi0;->f:I

    iget v7, p0, Ll/izi0;->g:I

    iget v8, p0, Ll/izi0;->h:I

    iget v9, p0, Ll/izi0;->i:F

    iget v10, p0, Ll/izi0;->j:F

    move-object v11, p1

    check-cast v11, [I

    invoke-static/range {v0 .. v11}, Lv/TickerView;->b(Lv/TickerView;Ll/x20;Ll/x20;JFIIIFF[I)V

    return-void
.end method
