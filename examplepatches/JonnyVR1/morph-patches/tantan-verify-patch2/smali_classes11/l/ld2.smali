.class public final synthetic Ll/ld2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/md2$a$a$a;

.field public final synthetic b:I

.field public final synthetic c:J

.field public final synthetic d:J


# direct methods
.method public synthetic constructor <init>(Ll/md2$a$a$a;IJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ld2;->a:Ll/md2$a$a$a;

    iput p2, p0, Ll/ld2;->b:I

    iput-wide p3, p0, Ll/ld2;->c:J

    iput-wide p5, p0, Ll/ld2;->d:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ld2;->a:Ll/md2$a$a$a;

    iget v1, p0, Ll/ld2;->b:I

    iget-wide v2, p0, Ll/ld2;->c:J

    iget-wide v4, p0, Ll/ld2;->d:J

    invoke-static/range {v0 .. v5}, Ll/md2$a$a;->a(Ll/md2$a$a$a;IJJ)V

    return-void
.end method
