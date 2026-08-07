.class public final synthetic Ll/wz70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/j080;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Ll/j080;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wz70;->a:Ll/j080;

    iput-wide p2, p0, Ll/wz70;->b:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wz70;->a:Ll/j080;

    iget-wide v1, p0, Ll/wz70;->b:J

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, v1, v2, p1, p2}, Ll/j080;->X3(Ll/j080;JLjava/lang/Integer;Ljava/lang/Object;)V

    return-void
.end method
