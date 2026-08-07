.class public final synthetic Ll/e50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(JLjava/lang/String;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/e50;->a:J

    iput-object p3, p0, Ll/e50;->b:Ljava/lang/String;

    iput-object p4, p0, Ll/e50;->c:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-wide v0, p0, Ll/e50;->a:J

    iget-object v2, p0, Ll/e50;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/e50;->c:Landroid/content/Context;

    invoke-static {v0, v1, v2, p0}, Ll/i50;->b(JLjava/lang/String;Landroid/content/Context;)V

    return-void
.end method
