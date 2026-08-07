.class public final synthetic Ll/i3n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/l3n0;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:J

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/l3n0;Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i3n0;->a:Ll/l3n0;

    iput-object p2, p0, Ll/i3n0;->b:Landroid/content/Context;

    iput-object p3, p0, Ll/i3n0;->c:Ljava/lang/String;

    iput-wide p4, p0, Ll/i3n0;->d:J

    iput-object p6, p0, Ll/i3n0;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/i3n0;->a:Ll/l3n0;

    iget-object v1, p0, Ll/i3n0;->b:Landroid/content/Context;

    iget-object v2, p0, Ll/i3n0;->c:Ljava/lang/String;

    iget-wide v3, p0, Ll/i3n0;->d:J

    iget-object v5, p0, Ll/i3n0;->e:Ljava/lang/String;

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v6}, Ll/l3n0;->b(Ll/l3n0;Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
