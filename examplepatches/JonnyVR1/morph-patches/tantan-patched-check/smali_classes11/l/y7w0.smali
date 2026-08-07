.class public final Ll/y7w0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/z7w0;

.field public final synthetic b:I


# direct methods
.method public constructor <init>(Ll/z7w0;I)V
    .locals 0

    .line 1
    iput p2, p0, Ll/y7w0;->b:I

    .line 2
    .line 3
    iput-object p1, p0, Ll/y7w0;->a:Ll/z7w0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string p0, "BufferingUrlPinger.attributionReportingManager"

    .line 2
    .line 3
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1, p0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    iget v0, p0, Ll/y7w0;->b:I

    .line 4
    .line 5
    iget-object p0, p0, Ll/y7w0;->a:Ll/z7w0;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Ll/z7w0;->b(Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
