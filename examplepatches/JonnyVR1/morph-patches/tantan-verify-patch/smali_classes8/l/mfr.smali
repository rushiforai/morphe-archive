.class public final synthetic Ll/mfr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ofr;

.field public final synthetic b:J

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Ll/ofr;JJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mfr;->a:Ll/ofr;

    iput-wide p2, p0, Ll/mfr;->b:J

    iput-wide p4, p0, Ll/mfr;->c:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/mfr;->a:Ll/ofr;

    iget-wide v1, p0, Ll/mfr;->b:J

    iget-wide v3, p0, Ll/mfr;->c:J

    move-object v5, p1

    check-cast v5, Ljava/lang/Long;

    invoke-static/range {v0 .. v5}, Ll/ofr;->d(Ll/ofr;JJLjava/lang/Long;)V

    return-void
.end method
