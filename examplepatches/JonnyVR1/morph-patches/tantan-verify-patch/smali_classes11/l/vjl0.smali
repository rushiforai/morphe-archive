.class public final synthetic Ll/vjl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wjl0$a;

.field public final synthetic b:J

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/wjl0$a;JI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vjl0;->a:Ll/wjl0$a;

    iput-wide p2, p0, Ll/vjl0;->b:J

    iput p4, p0, Ll/vjl0;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vjl0;->a:Ll/wjl0$a;

    iget-wide v1, p0, Ll/vjl0;->b:J

    iget p0, p0, Ll/vjl0;->c:I

    invoke-static {v0, v1, v2, p0}, Ll/wjl0$a;->e(Ll/wjl0$a;JI)V

    return-void
.end method
