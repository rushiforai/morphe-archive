.class public final synthetic Ll/qnx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ylx0;


# instance fields
.field public synthetic a:Ll/wkx0;

.field public synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/wkx0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qnx0;->a:Ll/wkx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/qnx0;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qnx0;->a:Ll/wkx0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qnx0;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wkx0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
