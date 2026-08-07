.class public final synthetic Ll/h50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(JLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/h50;->a:J

    iput-object p3, p0, Ll/h50;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/h50;->a:J

    iget-object p0, p0, Ll/h50;->b:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/i50;->d(JLjava/lang/String;)V

    return-void
.end method
