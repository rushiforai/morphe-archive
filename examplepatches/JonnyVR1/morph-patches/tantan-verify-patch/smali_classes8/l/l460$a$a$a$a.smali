.class public Ll/l460$a$a$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/l460$a$a$a;->request(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ll/l460$a$a$a;


# direct methods
.method public constructor <init>(Ll/l460$a$a$a;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l460$a$a$a$a;->b:Ll/l460$a$a$a;

    .line 2
    .line 3
    iput-wide p2, p0, Ll/l460$a$a$a$a;->a:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l460$a$a$a$a;->b:Ll/l460$a$a$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/l460$a$a$a;->a:Ll/vk90;

    .line 4
    .line 5
    iget-wide v1, p0, Ll/l460$a$a$a$a;->a:J

    .line 6
    .line 7
    invoke-interface {v0, v1, v2}, Ll/vk90;->request(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
