.class final Le/e/a/PausedCenter218$Check;
.super Ljava/lang/Object;
.source "PausedCenter218.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PausedCenter218;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Check"
.end annotation


# instance fields
.field private final delay:I

.field private final reference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/view/View;I)V
    .registers 4

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/PausedCenter218$Check;->reference:Ljava/lang/ref/WeakReference;

    iput p2, p0, Le/e/a/PausedCenter218$Check;->delay:I

    return-void
.end method


# virtual methods
.method public run()V
    .registers 14

    .line 123
    iget-object v0, p0, Le/e/a/PausedCenter218$Check;->reference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 124
    if-eqz v0, :cond_9

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_2

    .line 125
    :cond_0
    const-string v1, "viewbutton"

    # invokes: Le/e/a/PausedCenter218;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {v0, v1}, Le/e/a/PausedCenter218;->access$000(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    .line 126
    const-string v2, "viewctrllay"

    # invokes: Le/e/a/PausedCenter218;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {v0, v2}, Le/e/a/PausedCenter218;->access$000(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    .line 127
    const-string v3, "videoLayout"

    # invokes: Le/e/a/PausedCenter218;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {v0, v3}, Le/e/a/PausedCenter218;->access$000(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    .line 128
    if-eqz v1, :cond_8

    if-eqz v2, :cond_8

    if-nez v3, :cond_1

    goto/16 :goto_1

    .line 129
    :cond_1
    # invokes: Le/e/a/PausedCenter218;->paused(Landroid/view/View;)Ljava/lang/Boolean;
    invoke-static {v0}, Le/e/a/PausedCenter218;->access$100(Landroid/view/View;)Ljava/lang/Boolean;

    move-result-object v4

    .line 130
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v5

    .line 131
    const/4 v6, 0x2

    new-array v7, v6, [I

    .line 132
    new-array v8, v6, [I

    .line 133
    invoke-virtual {v1, v7}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 134
    invoke-virtual {v3, v8}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 135
    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9}, Landroid/graphics/Rect;-><init>()V

    .line 136
    invoke-virtual {v1, v9}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v10

    .line 137
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "delay="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p0, Le/e/a/PausedCenter218$Check;->delay:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " paused="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " playVisibility="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " alpha="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 138
    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " playShown="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 139
    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " playGlobal="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " playRect="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 140
    invoke-virtual {v9}, Landroid/graphics/Rect;->toShortString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " pos="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/4 v10, 0x0

    aget v11, v7, v10

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, ","

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/4 v12, 0x1

    aget v7, v7, v12

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, " hostVisibility="

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 142
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, " hostShown="

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 143
    invoke-virtual {v2}, Landroid/view/View;->isShown()Z

    move-result v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, " hostAlpha="

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    move-result v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, " hostTranslation="

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 144
    invoke-virtual {v2}, Landroid/view/View;->getTranslationX()F

    move-result v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    move-result v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, " videoShown="

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 145
    invoke-virtual {v3}, Landroid/view/View;->isShown()Z

    move-result v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, " videoPos="

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget v9, v8, v10

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget v8, v8, v12

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " videoSize="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 147
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "x"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, " size="

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 148
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 137
    # invokes: Le/e/a/PausedCenter218;->debug(Ljava/lang/String;)V
    invoke-static {v7}, Le/e/a/PausedCenter218;->access$200(Ljava/lang/String;)V

    .line 151
    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v7, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 152
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_7

    invoke-virtual {v2}, Landroid/view/View;->isShown()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 153
    invoke-virtual {v3}, Landroid/view/View;->isShown()Z

    move-result v4

    if-nez v4, :cond_2

    goto/16 :goto_0

    .line 155
    :cond_2
    const/4 v4, 0x4

    if-eq v5, v4, :cond_3

    const/16 v4, 0x8

    if-ne v5, v4, :cond_4

    .line 156
    :cond_3
    invoke-virtual {v1, v10}, Landroid/view/View;->setVisibility(I)V

    .line 157
    const-string v4, "restored paused center play visibility after handoff"

    # invokes: Le/e/a/PausedCenter218;->debug(Ljava/lang/String;)V
    invoke-static {v4}, Le/e/a/PausedCenter218;->access$200(Ljava/lang/String;)V

    .line 161
    :cond_4
    nop

    .line 162
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 161
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 162
    const-string v4, "player_controls_outside_video"

    invoke-interface {v0, v4, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 163
    if-nez v0, :cond_6

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_6

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lez v0, :cond_6

    .line 164
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_6

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lez v0, :cond_6

    .line 165
    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 166
    new-array v0, v6, [I

    new-array v4, v6, [I

    .line 167
    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 168
    invoke-virtual {v3, v4}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 169
    aget v5, v0, v10

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v7

    div-int/2addr v7, v6

    add-int/2addr v5, v7

    .line 170
    aget v0, v0, v12

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    div-int/2addr v1, v6

    add-int/2addr v0, v1

    .line 171
    aget v1, v4, v10

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v7

    div-int/2addr v7, v6

    add-int/2addr v1, v7

    .line 172
    aget v4, v4, v12

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v7

    div-int/2addr v7, v6

    add-int/2addr v4, v7

    .line 175
    sub-int v7, v5, v1

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v8

    div-int/2addr v8, v6

    if-gt v7, v8, :cond_5

    sub-int v7, v0, v4

    .line 176
    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    div-int/2addr v3, v6

    if-le v7, v3, :cond_6

    .line 177
    :cond_5
    invoke-virtual {v2}, Landroid/view/View;->getTranslationX()F

    move-result v3

    sub-int v6, v1, v5

    int-to-float v6, v6

    add-float/2addr v3, v6

    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 178
    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    move-result v3

    sub-int v6, v4, v0

    int-to-float v6, v6

    add-float/2addr v3, v6

    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationY(F)V

    .line 179
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "recentered displaced paused control from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " to "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    # invokes: Le/e/a/PausedCenter218;->debug(Ljava/lang/String;)V
    invoke-static {v0}, Le/e/a/PausedCenter218;->access$200(Ljava/lang/String;)V

    .line 183
    :cond_6
    return-void

    .line 154
    :cond_7
    :goto_0
    return-void

    .line 128
    :cond_8
    :goto_1
    return-void

    .line 124
    :cond_9
    :goto_2
    return-void
.end method
