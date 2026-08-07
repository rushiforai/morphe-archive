.class public final synthetic Ll/vjb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/dkb;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Ll/dkb;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vjb;->a:Ll/dkb;

    iput-object p2, p0, Ll/vjb;->b:Ljava/lang/String;

    iput-wide p3, p0, Ll/vjb;->c:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vjb;->a:Ll/dkb;

    iget-object v1, p0, Ll/vjb;->b:Ljava/lang/String;

    iget-wide v2, p0, Ll/vjb;->c:J

    invoke-static {v0, v1, v2, v3}, Ll/dkb;->u4(Ll/dkb;Ljava/lang/String;J)V

    return-void
.end method
