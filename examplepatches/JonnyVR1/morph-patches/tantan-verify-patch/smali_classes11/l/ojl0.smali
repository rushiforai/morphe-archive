.class public final synthetic Ll/ojl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wjl0$a;

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Ll/wjl0$a;Ljava/lang/Object;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ojl0;->a:Ll/wjl0$a;

    iput-object p2, p0, Ll/ojl0;->b:Ljava/lang/Object;

    iput-wide p3, p0, Ll/ojl0;->c:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ojl0;->a:Ll/wjl0$a;

    iget-object v1, p0, Ll/ojl0;->b:Ljava/lang/Object;

    iget-wide v2, p0, Ll/ojl0;->c:J

    invoke-static {v0, v1, v2, v3}, Ll/wjl0$a;->d(Ll/wjl0$a;Ljava/lang/Object;J)V

    return-void
.end method
