.class Lcn/qqtheme/framework/wheelview/WheelView$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcn/qqtheme/framework/wheelview/WheelScroller$ScrollingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/qqtheme/framework/wheelview/WheelView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/qqtheme/framework/wheelview/WheelView;


# direct methods
.method public constructor <init>(Lcn/qqtheme/framework/wheelview/WheelView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 2
    .line 3
    invoke-static {v0}, Lcn/qqtheme/framework/wheelview/WheelView;->access$000(Lcn/qqtheme/framework/wheelview/WheelView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcn/qqtheme/framework/wheelview/WheelView;->notifyScrollingListenersAboutEnd()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcn/qqtheme/framework/wheelview/WheelView;->access$002(Lcn/qqtheme/framework/wheelview/WheelView;Z)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 21
    .line 22
    invoke-static {v0, v1}, Lcn/qqtheme/framework/wheelview/WheelView;->access$202(Lcn/qqtheme/framework/wheelview/WheelView;I)I

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onJustify()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 2
    .line 3
    invoke-static {v0}, Lcn/qqtheme/framework/wheelview/WheelView;->access$200(Lcn/qqtheme/framework/wheelview/WheelView;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-le v0, v1, :cond_3

    .line 13
    .line 14
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 15
    .line 16
    invoke-static {v0}, Lcn/qqtheme/framework/wheelview/WheelView;->access$400(Lcn/qqtheme/framework/wheelview/WheelView;)Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 23
    .line 24
    invoke-static {v0}, Lcn/qqtheme/framework/wheelview/WheelView;->access$500(Lcn/qqtheme/framework/wheelview/WheelView;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v2, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 29
    .line 30
    invoke-static {v2}, Lcn/qqtheme/framework/wheelview/WheelView;->access$500(Lcn/qqtheme/framework/wheelview/WheelView;)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    iget-object v3, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 35
    .line 36
    invoke-static {v3}, Lcn/qqtheme/framework/wheelview/WheelView;->access$400(Lcn/qqtheme/framework/wheelview/WheelView;)Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v3}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getFirst()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    iget-object v4, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 45
    .line 46
    if-ge v2, v3, :cond_0

    .line 47
    .line 48
    invoke-static {v4}, Lcn/qqtheme/framework/wheelview/WheelView;->access$200(Lcn/qqtheme/framework/wheelview/WheelView;)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    iget-object v3, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 53
    .line 54
    invoke-static {v3}, Lcn/qqtheme/framework/wheelview/WheelView;->access$400(Lcn/qqtheme/framework/wheelview/WheelView;)Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v3}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getFirst()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    iget-object v5, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 63
    .line 64
    invoke-static {v5}, Lcn/qqtheme/framework/wheelview/WheelView;->access$500(Lcn/qqtheme/framework/wheelview/WheelView;)I

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    sub-int/2addr v3, v5

    .line 69
    sub-int/2addr v3, v1

    .line 70
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 71
    .line 72
    invoke-static {v1}, Lcn/qqtheme/framework/wheelview/WheelView;->access$600(Lcn/qqtheme/framework/wheelview/WheelView;)I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    mul-int/2addr v3, v1

    .line 77
    sub-int/2addr v2, v3

    .line 78
    invoke-static {v4, v2}, Lcn/qqtheme/framework/wheelview/WheelView;->access$202(Lcn/qqtheme/framework/wheelview/WheelView;I)I

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 82
    .line 83
    invoke-static {v1}, Lcn/qqtheme/framework/wheelview/WheelView;->access$400(Lcn/qqtheme/framework/wheelview/WheelView;)Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v2}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getFirst()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    invoke-static {v1, v2}, Lcn/qqtheme/framework/wheelview/WheelView;->access$502(Lcn/qqtheme/framework/wheelview/WheelView;I)I

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_0
    invoke-static {v4}, Lcn/qqtheme/framework/wheelview/WheelView;->access$500(Lcn/qqtheme/framework/wheelview/WheelView;)I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    iget-object v2, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 100
    .line 101
    invoke-static {v2}, Lcn/qqtheme/framework/wheelview/WheelView;->access$400(Lcn/qqtheme/framework/wheelview/WheelView;)Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v2}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getLast()I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    if-le v1, v2, :cond_1

    .line 110
    .line 111
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 112
    .line 113
    invoke-static {v1}, Lcn/qqtheme/framework/wheelview/WheelView;->access$200(Lcn/qqtheme/framework/wheelview/WheelView;)I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    iget-object v3, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 118
    .line 119
    invoke-static {v3}, Lcn/qqtheme/framework/wheelview/WheelView;->access$500(Lcn/qqtheme/framework/wheelview/WheelView;)I

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    iget-object v4, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 124
    .line 125
    invoke-static {v4}, Lcn/qqtheme/framework/wheelview/WheelView;->access$400(Lcn/qqtheme/framework/wheelview/WheelView;)Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    invoke-virtual {v4}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getLast()I

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    sub-int/2addr v3, v4

    .line 134
    iget-object v4, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 135
    .line 136
    invoke-static {v4}, Lcn/qqtheme/framework/wheelview/WheelView;->access$600(Lcn/qqtheme/framework/wheelview/WheelView;)I

    .line 137
    .line 138
    .line 139
    move-result v4

    .line 140
    mul-int/2addr v3, v4

    .line 141
    add-int/2addr v2, v3

    .line 142
    invoke-static {v1, v2}, Lcn/qqtheme/framework/wheelview/WheelView;->access$202(Lcn/qqtheme/framework/wheelview/WheelView;I)I

    .line 143
    .line 144
    .line 145
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 146
    .line 147
    invoke-static {v1}, Lcn/qqtheme/framework/wheelview/WheelView;->access$400(Lcn/qqtheme/framework/wheelview/WheelView;)Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-virtual {v2}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getLast()I

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    invoke-static {v1, v2}, Lcn/qqtheme/framework/wheelview/WheelView;->access$502(Lcn/qqtheme/framework/wheelview/WheelView;I)I

    .line 156
    .line 157
    .line 158
    :cond_1
    :goto_0
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 159
    .line 160
    invoke-static {v1}, Lcn/qqtheme/framework/wheelview/WheelView;->access$500(Lcn/qqtheme/framework/wheelview/WheelView;)I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-eq v0, v1, :cond_2

    .line 165
    .line 166
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 167
    .line 168
    invoke-static {v1}, Lcn/qqtheme/framework/wheelview/WheelView;->access$500(Lcn/qqtheme/framework/wheelview/WheelView;)I

    .line 169
    .line 170
    .line 171
    move-result v2

    .line 172
    invoke-virtual {v1, v0, v2}, Lcn/qqtheme/framework/wheelview/WheelView;->notifyChangingListeners(II)V

    .line 173
    .line 174
    .line 175
    :cond_2
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 176
    .line 177
    invoke-static {v0}, Lcn/qqtheme/framework/wheelview/WheelView;->access$300(Lcn/qqtheme/framework/wheelview/WheelView;)Lcn/qqtheme/framework/wheelview/WheelScroller;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 182
    .line 183
    invoke-static {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->access$200(Lcn/qqtheme/framework/wheelview/WheelView;)I

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    const/4 v1, 0x0

    .line 188
    invoke-virtual {v0, p0, v1}, Lcn/qqtheme/framework/wheelview/WheelScroller;->scroll(II)V

    .line 189
    .line 190
    .line 191
    :cond_3
    return-void
.end method

.method public onScroll(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->access$100(Lcn/qqtheme/framework/wheelview/WheelView;I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 13
    .line 14
    invoke-static {v0}, Lcn/qqtheme/framework/wheelview/WheelView;->access$200(Lcn/qqtheme/framework/wheelview/WheelView;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 19
    .line 20
    if-le v0, p1, :cond_0

    .line 21
    .line 22
    invoke-static {v1, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->access$202(Lcn/qqtheme/framework/wheelview/WheelView;I)I

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 26
    .line 27
    invoke-static {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->access$300(Lcn/qqtheme/framework/wheelview/WheelView;)Lcn/qqtheme/framework/wheelview/WheelScroller;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcn/qqtheme/framework/wheelview/WheelScroller;->stopScrolling()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-static {v1}, Lcn/qqtheme/framework/wheelview/WheelView;->access$200(Lcn/qqtheme/framework/wheelview/WheelView;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    neg-int p1, p1

    .line 40
    if-ge v0, p1, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 43
    .line 44
    invoke-static {v0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->access$202(Lcn/qqtheme/framework/wheelview/WheelView;I)I

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 48
    .line 49
    invoke-static {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->access$300(Lcn/qqtheme/framework/wheelview/WheelView;)Lcn/qqtheme/framework/wheelview/WheelScroller;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Lcn/qqtheme/framework/wheelview/WheelScroller;->stopScrolling()V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public onStarted()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Lcn/qqtheme/framework/wheelview/WheelView;->access$002(Lcn/qqtheme/framework/wheelview/WheelView;Z)Z

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->notifyScrollingListenersAboutStart()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
