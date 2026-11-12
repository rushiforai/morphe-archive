.class public final synthetic Lw40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(JJ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lw40;->a:J

    iput-wide p3, p0, Lw40;->b:J

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    check-cast p1, Lx40;

    iget-object v4, p1, Lx40;->a:Ljava/lang/String;

    iget-object v5, p1, Lx40;->b:Lorg/chromium/url/GURL;

    iget-wide v0, p0, Lw40;->a:J

    iget-wide v2, p0, Lw40;->b:J

    invoke-static/range {v0 .. v5}, LJ/N;->M3HME06W(JJLjava/lang/Object;Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method
