.class public final synthetic Ll/sjl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wjl0$a;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:J

.field public final synthetic d:J


# direct methods
.method public synthetic constructor <init>(Ll/wjl0$a;Ljava/lang/String;JJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sjl0;->a:Ll/wjl0$a;

    iput-object p2, p0, Ll/sjl0;->b:Ljava/lang/String;

    iput-wide p3, p0, Ll/sjl0;->c:J

    iput-wide p5, p0, Ll/sjl0;->d:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/sjl0;->a:Ll/wjl0$a;

    iget-object v1, p0, Ll/sjl0;->b:Ljava/lang/String;

    iget-wide v2, p0, Ll/sjl0;->c:J

    iget-wide v4, p0, Ll/sjl0;->d:J

    invoke-static/range {v0 .. v5}, Ll/wjl0$a;->h(Ll/wjl0$a;Ljava/lang/String;JJ)V

    return-void
.end method
