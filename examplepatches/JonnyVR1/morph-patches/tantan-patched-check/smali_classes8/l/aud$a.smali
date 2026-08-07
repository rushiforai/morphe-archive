.class public final Ll/aud$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/aud;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/aud;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/aud<",
            "**>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/aud;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/aud<",
            "**>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/aud$a;->a:Ll/aud;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aud$a;->a:Ll/aud;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/aud;->i(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
